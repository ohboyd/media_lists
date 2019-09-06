Rails.application.routes.draw do

  resources :media do
    resources :reviews, except: :index

    collection do
      get :movies_index
      get :books_index
      get :shows_index
      get :podcasts_index
      get :music_index
      patch :sort
    end

  end

  get 'reviews', to: 'reviews#index'
  post 'reviews', to: 'reviews#create'

  root 'reviews#index'
end
