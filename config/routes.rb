Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :articles

  root 'welcome#index'
end
