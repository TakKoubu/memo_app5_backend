Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :users
    resources :memos, only: [:index, :create, :destroy, :show] do
      resource :favorites, only: [:create, :destroy]
      get :search , on: :collection
    end
  end
end
