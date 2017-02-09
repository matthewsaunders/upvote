Rails.application.routes.draw do

  devise_for :users

  resources :posts do
    resources :comments, only: [:index, :create]
  end

  root to: 'posts#index'

end
