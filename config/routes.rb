Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  resources :accounts
  resources :users
  resources :people
  namespace :api do
    namespace :v1 do
      resources :cities, only: :index
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

end
