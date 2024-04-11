Rails.application.routes.draw do
  get "search", to: "search#search"
  root "citizens#index"
  resources :citizens, path: 'municipes', path_names: { new: 'novo', edit: 'editar'}, except: :destroy
  get 'citizens/index'
  get 'citizens/new'
  get 'citizens/create'
  get 'citizens/edit'
  get 'citizens/update'

  get 'addresses/cities', to: 'addresses#cities'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
