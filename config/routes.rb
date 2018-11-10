Rails.application.routes.draw do
  devise_for :user,skip: :all,controllers: { passwords: 'passwords' }
  devise_scope :user do
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
    post 'sign_in', to: 'devise/registrations#create', as: :user_registration
    get 'password/edit', to: 'users/passwords#edit', as: :edit_user_password
    patch 'password/edit', to: 'users/passwords#update'
    put 'password/edit', to: 'users/passwords#update'
    post 'password/edit', to: 'users/passwords#create',as: :user_password
  end

  #devise パスワードを忘れた場合のメール処理
  if Rails.env.development? || Rails.env.staging?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  resources :posts
  resources :users
  get 'rankings/post_ranking', to: 'rankings#post_ranking'
end
