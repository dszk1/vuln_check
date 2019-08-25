Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, controllers: {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
  }
  resources :posts, only: [:create, :edit, :update, :destroy, :show]
end
