Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:create, :destroy]
      resources :customers, only: [:show]
    end
  end
end
