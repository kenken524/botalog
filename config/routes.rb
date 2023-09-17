Rails.application.routes.draw do
  devise_for :users,  controllers: { registrations: 'users/registrations' }
  root to: 'plants#index'
  resources :plants do
    resources :comments, module: :plants
    resources :likes, only: [:create, :destroy]
  end
  
  resources :care_records do
    resources :comments, module: :care_records
    resources :likes, only: [:create, :destroy]
  end

  get 'users/mypage/:id', to: 'users#mypage', as: 'user_mypage'
end
