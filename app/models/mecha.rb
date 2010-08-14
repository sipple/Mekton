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

  
end
