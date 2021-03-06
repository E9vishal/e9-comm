Rails.application.routes.draw do

resources :connections

  get 'connections', to: 'connections#index'

  post '/connections', to: 'connections#create'
  
  get '/connections/new', to: 'connections#news'

  get 'salesforce_products/index'


  get 'auth/salesforce/callback', to: 'salesforce#callback'

 # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, at: '/'

          # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end

 