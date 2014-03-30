PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: :destroy

  resources :post_categories, only: [:index, :show]

  resources :categories, except: :destroy
end
