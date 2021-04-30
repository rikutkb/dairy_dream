Rails.application.routes.draw do
  get 'sessions/new'
  get 'signup' => "users#new"
  get 'login' =>"sessions#new"
  post 'login' =>"sessions#create"
  get 'logout' =>"session#destroy"
  resources :users,only: [:index,:show,:create,:edit]

  resources :diaries, only: [:index,:show,:create,:new,:edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
