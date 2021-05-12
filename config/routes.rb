Rails.application.routes.draw do
  root to: "static_pages#home"
  get 'help' =>"static_pages#help"
  get 'about' => "static_pages#about"
  get 'news' => "static_pages#news"
  get 'sessions/new'
  get 'signup' => "users#new"
  get 'login' =>"sessions#new"
  post 'login' =>"sessions#create"
  delete 'logout' =>"sessions#destroy"
  resources :users,only: [:index,:show,:create,:edit]
  resources :tags,only: [:index,:show,:create] do
    collection do
      get 'search'
    end
  end

  resources :articles, only: [:index,:show,:create,:edit,:new,:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
