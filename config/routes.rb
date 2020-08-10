Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users, controllers: { registrations: 'registrations' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}

  resources :articles

  root 'welcome#index'
end
