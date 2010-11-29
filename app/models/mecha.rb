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


  def weight
    # self.mecha_objects.all.sum(&:field)
    0
  end

  def mv
    case weight
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
    case weight
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
    0
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
  
end
