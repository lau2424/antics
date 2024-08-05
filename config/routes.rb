Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # Routes pour les items
  resources :items
  resources :users

  # Routes personnalisées
  get 'myitems', to: 'items#myitems', as: 'myitems'
  get 'mypage', to: 'items#mypage', as: 'mypage'
  
  # Route racine
  root to: 'items#index'
end


