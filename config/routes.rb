Rails.application.routes.draw do
  root to: 'movies#index'
  resources :movies
end
