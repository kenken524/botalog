Rails.application.routes.draw do
  devise_for :users,  controllers: { registrations: 'users/registrations' }
  root to: 'plants#index'
  resources :plants

  get 'users/mypage/:id', to: 'users#mypage', as: 'user_mypage'
end
