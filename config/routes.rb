Rails.application.routes.draw do
  devise_for :users,  controllers: { registrations: 'users/registrations' }
  root to: 'plants#index'
  resources :plants 
  resources :care_records

  get 'users/mypage/:id', to: 'users#mypage', as: 'user_mypage'
end
