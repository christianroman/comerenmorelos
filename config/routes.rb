Comerenmorelos::Application.routes.draw do

  ###########################################################
  # Admin
  namespace :admin do

    #devise_for :users, :path => 'auth', :controllers => { :sessions => 'admin/sessions', :registrations => 'admin/registrations' }, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'registro', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock' }
    devise_for :users, :path => 'auth', :controllers => { :sessions => 'admin/sessions' }, :skip => :registrations
    resources :users, :path => 'usuarios'

    root :to => 'restaurants#index'

    #resources :restaurants, :path => 'restaurantes'
    resources :restaurants, :path => 'restaurantes'
    resources :fares, :path => 'rangotarifas'
    resources :destinations, :except => [:show], :path => 'destinos'
    resources :categories, :path => 'categorias'
    resources :rooms, :path => 'habitaciones'
    resources :guests, :path => 'clientes'
    resources :reservations, :path => 'reservaciones'
    resources :contacts, :path => 'contactos'
    resources :availabilities, :path => 'fechas'
    resources :pages, :path => 'paginas'

    get 'ajustes' => 'settings#edit'
    resources :settings, :path => 'ajustes', :only => ['edit', 'update']

  end

  ###########################################################
  # API v1
  namespace :api, defaults: { format: 'json' } do

    root :to => 'home#index'

    resources :home, :only => [:index]

    resources :restaurants, :only => [:index, :show, :create], :path => 'restaurantes'
    resources :destinations, :only => [:index], :path => 'destinos'
    resources :categories, :only => [:index], :path => 'categorias'
    resources :fares, :only => [:index], :path => 'tarifas'
  end

  ###########################################################
  # UI

  resources :search, :only => :index

  resources :restaurants, :path => 'restaurantes', :only => [:show, :create]
  #match '', to: 'restaurants#show', constraints: {subdomain: /.+/}
  match '', to: 'restaurants#show', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  #match '/' => 'restaurants#show', constraints: { subdomain: /^(?!www$)(.+)$/i }

  resources :pages, :path => 'paginas', :only => :show

  post 'restaurantes/:id/reservar' => 'restaurants#create'

  resources :payment_notifications

  root :to => 'home#index'

  #resources :home do
  #	collection do
  #	    get 'search'
  #	end
  #    end

  #devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
