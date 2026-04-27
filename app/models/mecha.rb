class Mecha < ApplicationRecord
  scope :active, -> { where(disabled: false).order(name: :asc) }

  has_many :mecha_additives, dependent: :destroy
  has_many :mecha_modifiers, dependent: :destroy
  has_many :mecha_movements, dependent: :destroy
  has_many :mecha_multipliers, dependent: :destroy
  has_many :mecha_sensors, dependent: :destroy
  has_many :mecha_servos, dependent: :destroy
  has_many :mecha_shields, dependent: :destroy
  has_many :mecha_subassemblies, dependent: :destroy
  has_many :mecha_weapons, dependent: :destroy

  belongs_to :character

  BASE_LAND_MA = 6
  BASE_FLIGHT_MA = 0
  BASE_MV = -1
  MECHA_SYSTEMS = %i[mecha_movements mecha_servos mecha_weapons mecha_shields mecha_subassemblies mecha_sensors].freeze

  # --- RPG Math: Weight ---

  def weight
    @weight ||= weight_for(MECHA_SYSTEMS)
  end

  # --- RPG Math: Cost ---

  def cost
    (base_cost * total_multipliers).round
  end

  def base_cost
    cost_for(MECHA_SYSTEMS)
  end

  # --- RPG Math: Maneuver Pool ---

  def maneuver_pool
    (character.maneuver_pool + (character.maneuver_pool * (mp_bonus * 0.01))).floor
  end

  def mp_bonus
    super || 0
  end

  # --- RPG Math: MV (Maneuver Value) ---

  def mv
    (mv_bonus || 0) + base_mv
  end

  def base_mv
    case weight.floor
    when 0..19   then -1
    when 20..29  then -2
    when 30..39  then -3
    when 40..49  then -4
    when 50..59  then -5
    when 60..69  then -6
    when 70..79  then -7
    when 80..89  then -8
    when 90..99  then -9
    else              -10
    end
  end

  # --- RPG Math: MA (Maneuver Allowance) ---

  def land_ma
    (ma_bonus || 0) + base_land_ma
  end

  def base_land_ma
    case weight.floor
    when 0..19  then 6
    when 20..39 then 5
    when 40..59 then 4
    when 60..79 then 3
    else             2
    end
  end

  # --- RPG Math: Flight & Ground Effects ---

  def flight_ma
    speed = 0
    mecha_movements.find_each do |movement|
      speed += (movement.speed || 0) unless movement.movement_system == "Ground Effects"
    end
    speed + (ma_bonus || 0)
  end

  def ground_effects
    speed = 0
    mecha_movements.find_each do |movement|
      speed += (movement.speed || 0) if movement.movement_system == "Ground Effects"
    end
    speed + (ma_bonus || 0)
  end

  # --- RPG Math: Mecha Skills (derived from character + MV) ---

  def mecha_reflexes
    character.reflexes + mv
  end

  def mecha_piloting
    character.mecha_piloting + mecha_reflexes
  end

  def mecha_fighting
    character.mecha_fighting + mecha_reflexes
  end

  def mecha_melee
    character.mecha_melee + mecha_reflexes
  end

  def mecha_gunnery
    character.mecha_gunnery + mecha_reflexes
  end

  def mecha_missiles
    character.mecha_missiles + mecha_reflexes
  end

  # --- JSON Serialization ---

  def mecha_json
    as_json(
      methods: %i[
        weight cost mecha_reflexes mecha_piloting mecha_fighting
        mecha_melee mecha_gunnery mecha_missiles flight_ma
        land_ma mv ground_effects maneuver_pool
      ],
      include: [:character]
    )
  end

  private

  # Sums weight across given association symbols (calls Ruby #weight method, not SQL)
  def weight_for(systems)
    systems.sum(0.0) { |system| send(system).sum(0.0, &:weight) }
  end

  # Sums cost across given association symbols (calls Ruby #cost method, not SQL)
  def cost_for(systems)
    systems.sum(0.0) { |system| send(system).sum(0.0, &:cost) }
  end

  # Calculates total multiplier from all mecha_multipliers
  def total_multipliers
    mecha_multipliers.reduce(1) do |total, multiplier|
      total + (multiplier.quantity * multiplier.multiple)
    end
  end
end
