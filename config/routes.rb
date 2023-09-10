Rails.application.routes.draw do
  devise_for :users
  root to: 'plants#index'
  resources :plants, only: [:index, :new, :create, :show]

  get 'users/mypage/:id', to: 'users#mypage', as: 'user_mypage'
end
