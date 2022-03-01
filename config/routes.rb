Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :users
    resources :memos, only: [:index, :create, :destroy, :show, :update] do
      resource :favorites, only: [:create, :destroy]
      resource :statuses, only: [:update]
    end
    resources :tags, only: [:index]
  end
end
