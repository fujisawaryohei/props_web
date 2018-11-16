Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'rankings/post_ranking', to: 'rankings#post_ranking'
  get 'searches/index', to: 'searches#index'
  get 'searches/more_posts', to: 'searches#more_posts'
  get 'searches/more_users', to: 'searches#more_users'
end
