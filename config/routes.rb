Rails.application.routes.draw do
  # devise_for :user, skip: :all, controllers: { passwords: 'passwords' }
  # devise_scope :user do
  #   post 'login', to: 'devise/sessions#create', as: :user_session
  #   delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  #   post 'sign_in', to: 'devise/registrations#create', as: :user_registration
  #   get 'password/edit', to: 'users/passwords#edit', as: :edit_user_password
  #   patch 'password/edit', to: 'users/passwords#update'
  #   put 'password/edit', to: 'users/passwords#update'
  #   post 'password/edit', to: 'users/passwords#create',as: :user_password
  # end

  devise_for :users
  #devise パスワードを忘れた場合のメール処理
  if Rails.env.development? || Rails.env.staging?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :clips, only: [:create, :destroy]
  end
  resources :user
  get 'user/:id/following', to: 'user#following', as: :user_following
  get 'user/:id/follower', to: 'user#follower', as: :user_follower
  get 'user/:id/like', to: 'user#like', as: :user_like
  get 'user/:id/clip', to: 'user#clip', as: :user_clip
  get 'rankings/post_ranking', to: 'rankings#post_ranking'
  get 'rankings/user_ranking', to: 'rankings#user_ranking'
  get 'searches/index', to: 'searches#index'
  get 'searches/more_posts', to: 'searches#more_posts'
  get 'searches/more_users', to: 'searches#more_users'
  get 'notifications/index', to: 'notifications#index'
  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through
end
