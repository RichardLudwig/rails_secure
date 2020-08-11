Rails.application.routes.draw do
  get 'contact' => 'messages#new'

  resources :messages

  get 'welcome/index'

  devise_for :users, controllers: { registrations: 'registrations' }, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}

  resources :articles

  root 'welcome#index'

  get 'articles-search', to: 'articles#search'
  get 'messages-search', to: 'messages#search'
end
