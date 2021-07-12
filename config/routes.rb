Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :welcome, only: [:show, :create]
  resources :tracks, only: [:index, :show, :update, :create, :new, :destroy]
  resource :player, only: [:show, :create, :destroy]
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/square-player/:id', to: 'players#iframe', as: "iframe"
  # get "/" => "home#index", :as => "root"
end
