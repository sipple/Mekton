ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products
  map.resources :characters do |character|
    character.resources :character_armors
    character.resources :character_weapons
    character.resources :character_equipments
    character.resources :character_skills
  end

  map.resources :character_profession_data do |profession|
    profession.resources :character_profession_skill_data
  end

  map.resources :mechas do |mecha|
    mecha.resources :mecha_servos
    mecha.resources :mecha_weapons
    mecha.resources :mecha_sensors
    mecha.resources :mecha_subassemblies
    mecha.resources :mecha_shields
    mecha.resources :mecha_movements
  end

  map.character_select_options 'characters/:character_id/select_options', :controller => 'characters', :action => 'select_options'
  map.mecha_select_options 'mechas/:mecha_id/select_options', :controller => 'mechas', :action => 'select_options'

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
