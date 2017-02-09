Rails.application.routes.draw do

  devise_for :users

  resources :posts do
    resources :comments, only: [:index]
  end

  root to: 'posts#index'

end
