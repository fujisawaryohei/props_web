Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end

  get 'rankings/post_ranking', to: 'rankings#post_ranking'
end
