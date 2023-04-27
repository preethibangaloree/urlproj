Rails.application.routes.draw do
  resources :urlls
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "urlls#new"
   get '/:short_url', to: 'urlls#redirect'

end
