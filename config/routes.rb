Rails.application.routes.draw do
  resources :reviews

  resources :media do

    collection do
      get :movies_index
      get :books_index
      get :shows_index
      get :podcasts_index
      get :music_index
      patch :sort
    end
  end

  root 'reviews#index'
end
