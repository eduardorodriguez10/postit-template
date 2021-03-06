PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :posts, except: :destroy do
  	member do
  		post :vote
  	end
  	resources :comments, only: :create 
  end

  resources :comments, only: :none do 
  	member do 
  		post :vote
  	end
  end

  resources :post_categories, only: [:index, :show]

  resources :categories, except: :destroy
  
  resources :users, except: :destroy
end
