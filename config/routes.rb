QPT2a::Application.routes.draw do

  root :to => 'pages#home'
  match '/about', :to => 'pages#about'
  match '/imprint', :to => 'pages#imprint'
  
  get 'logout' => 'sessions#destroy', :as => 'log_out'
  get 'login' => 'sessions#new', :as => 'log_in'
  get 'signup' => 'users#new', :as => 'sign_up'
  
  resources :projects do
    # root :to => "users#show"
	
	get :work, :on => :collection
    get :study, :on => :collection
	
	resources :to_dos

    member do
	  get "todos"
	  get "time"
	end
  end

  resources :to_dos do
    get :done, :on => :collection
    get :outstanding, :on => :collection
  end

  resources :users do 
    resources :projects
  end 

  resources :sessions do
  
  end

end