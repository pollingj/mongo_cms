ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin| 
    admin.resources :users
    admin.resources :pages
    admin.resources :content_types
    admin.resources :assets
    admin.resource :user_session
  end
 
 
  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
