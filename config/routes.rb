Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root :to => 'devise/sessions#new' 
  end
  resources :articles do
    resources :comments
  end

  resources :users do
    resources :articles
  end
end
