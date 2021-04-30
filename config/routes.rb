Rails.application.routes.draw do
  get 'signup' => "users#new"
  resources :users,only: [:index,:show,:create,:edit]
  root to: 'diary#index'
  resources :diary, only: [:new,:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
