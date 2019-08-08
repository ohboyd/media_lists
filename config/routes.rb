Rails.application.routes.draw do
  resources :media do

    collection do
      get :movies_index
      get :books_index
      patch :sort
    end
  end

  root 'media#movies_index'
end
