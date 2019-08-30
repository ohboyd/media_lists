Rails.application.routes.draw do
  resources :media do
    resources :reviews

    collection do
      get :movies_index
      get :books_index
      get :shows_index
      get :podcasts_index
      get :music_index
      patch :sort
    end
  end

  root 'media#movies_index'
end
