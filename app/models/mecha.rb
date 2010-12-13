class Mecha < ActiveRecord::Base
  has_many :mecha_additives
  has_many :mecha_modifiers
  has_many :mecha_movements
  has_many :mecha_multipliers
  has_many :mecha_sensors
  has_many :mecha_servos
  has_many :mecha_shields
  has_many :mecha_subassemblies
  has_many :mecha_weapons

  belongs_to :character

  BASE_LAND_MA = 6
  BASE_FLIGHT_MA = 0
  BASE_MV = -1
  MECHA_SYSTEMS = [:mecha_movements, :mecha_servos, :mecha_weapons, :mecha_shields, :mecha_subassemblies, :mecha_sensors]

  def weight
    @weight = @weight || weight_for(MECHA_SYSTEMS)
    @weight
  end

  def cost
    (base_cost * total_multipliers).round
  end

  def base_cost
    cost_for MECHA_SYSTEMS
  end

  def maneuver_pool
    (self.character.maneuver_pool + (self.character.maneuver_pool * (self.mp_bonus * 0.01))).floor
  end

  def mp_bonus
    super || 0
  end

  def mv
    (self.mv_bonus || 0) + base_mv
  end

  def base_mv
    case weight.floor
      when 0..19
        -1
      when 20..29
        -2
      when 30..39
        -3
      when 40..49
        -4
      when 50..59
        -5
      when 60..69
        -6
      when 70..79
        -7
      when 80..89
        -8
      when 90..99
        -9
      else
        -10
    end
  end

  def land_ma
    (self.ma_bonus || 0) + base_land_ma
  end

  def base_land_ma
    case weight.floor
      when 0..19
        6
      when 20..39
        5
      when 40..59
        4
      when 60..79
        3
      else
        2
    end
  end

  def flight_ma
    speed = 0
    self.mecha_movements.all.each do |movement|
      speed += (movement.speed || 0) unless movement.movement_system == "Ground Effects"
    end
    speed + (self.ma_bonus || 0)
  end

  def ground_effects
    speed = 0
    self.mecha_movements.all.each do |movement|
      speed += (movement.speed || 0) if movement.movement_system == "Ground Effects"
    end
    speed + (self.ma_bonus || 0)
  end

  def mecha_reflexes
    self.character.reflexes + self.mv
  end

  def mecha_piloting
    self.character.mecha_piloting + self.mecha_reflexes
  end

  def mecha_fighting
    self.character.mecha_fighting + self.mecha_reflexes
  end

  def mecha_melee
    self.character.mecha_melee + self.mecha_reflexes
  end

  def mecha_gunnery
    self.character.mecha_gunnery + self.mecha_reflexes
  end

  def mecha_missiles
    self.character.mecha_missiles + self.mecha_reflexes
  end

  def mecha_json
    self.to_json(:methods => [:weight, :cost, :mecha_reflexes, :mecha_piloting, :mecha_fighting,
                                   :mecha_melee, :mecha_gunnery, :mecha_missiles, :flight_ma,
                                   :land_ma, :mv, :ground_effects, :maneuver_pool])
  end


  private

  # takes an array of symbols for the models you want to calculate wieght for. i.e. [:mecha_servos, :mecha_armos]
  def weight_for systems
    weight = 0
    systems.each do |system|
      weight += self.send(system).all.sum(&:weight)
    end
    weight
  end

  def cost_for systems
    cost = 0
    systems.each do |system|
      cost += self.send(system).all.sum(&:cost)
    end
    cost
  end

  def total_multipliers
    multipliers = 1
    self.mecha_multipliers.each do |multiplier|
      multipliers += multiplier.quantity * multiplier.multiple
    end
    multipliers
  end
  
end
