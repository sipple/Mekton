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


  def weight
    # self.mecha_objects.all.sum(&:field)
  end

  def mv
    -1
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
