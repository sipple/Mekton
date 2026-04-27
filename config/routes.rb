Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check

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
end
