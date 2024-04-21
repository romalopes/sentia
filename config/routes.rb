Rails.application.routes.draw do
  resources :affiliations
  resources :locations
  resources :people do
    collection do
      post 'import'
    end
  end
  get 'home/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
