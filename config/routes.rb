Rails.application.routes.draw do

  resource :session, only: %i[create destroy]
  get "signin" => "sessions#new"

  resources :users, except: :new
  get "signup" => "users#new"

  resources :media do
    collection do
      get :movies_index
      get :books_index
      get :shows_index
      get :podcasts_index
      get :music_index
      patch :sort
    end

    resources :reviews, except: :index
  end

  get 'reviews', to: 'reviews#index', as: :recent_reviews
  post 'reviews', to: 'reviews#create'

  root 'media#movies_index'
end
