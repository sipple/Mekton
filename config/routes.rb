Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check

  # --- Characters ---
  resources :characters do
    resources :character_armors, only: [:create, :update, :destroy]
    resources :character_weapons, only: [:create, :update, :destroy]
    resources :character_equipments, only: [:create, :update, :destroy]
    resources :character_skills, only: [:create, :update, :destroy]
    get "select_options", on: :member
  end

  resources :character_armor_data
  resources :character_skill_data
  resources :character_weapon_data
  resources :character_equipment_data

  resources :character_profession_data do
    resources :character_profession_skill_data, only: [:create, :update, :destroy]
  end

  # --- Mechas ---
  resources :mechas do
    resources :mecha_servos, only: [:create, :update, :destroy]
    resources :mecha_weapons, only: [:create, :update, :destroy]
    resources :mecha_shields, only: [:create, :update, :destroy]
    resources :mecha_sensors, only: [:create, :update, :destroy]
    resources :mecha_movements, only: [:create, :update, :destroy]
    resources :mecha_multipliers, only: [:create, :update, :destroy]
    resources :mecha_subassemblies, only: [:create, :update, :destroy]
    get "select_options", on: :member
  end

  # Mecha reference data CRUD (admin)
  resources :mecha_servo_data
  resources :mecha_weapon_data
  resources :mecha_armor_data
  resources :mecha_shield_data
  resources :mecha_sensor_data
  resources :mecha_movement_data
  resources :mecha_multiplier_data
  resources :mecha_subassembly_data
end
