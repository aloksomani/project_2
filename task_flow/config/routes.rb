Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  
  # All users controller routes
  get "users/new" => "users#new", as: :new_user
  get "users/:id" => "users#profile", as: :user
  post "users/" => "users#create"

  # All projects controller routes
  get "projects/" => "projects#index"
  get "projects/new" => "projects#new", as: :new_project
  get "projects/:id" => "projects#show", as: :project
  post "projects/" => "projects#create"



end
