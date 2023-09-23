Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users,  controllers: { registrations: 'users/registrations' }
  root to: 'plants#index'
  resources :plants do
    resources :comments, module: :plants
    resources :likes, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  
  resources :care_records do
    resources :comments, module: :care_records
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :users do
    member do
      post 'follow'
      delete 'unfollow'
    end
    collection do
      get 'search'
    end
  end

  resources :messages, only: [:create]
  resources :rooms, only: [:create, :index, :show]
end
