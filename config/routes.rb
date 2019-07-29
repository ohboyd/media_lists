Rails.application.routes.draw do
  resources :media do

    collection do
      get :movies_index
      patch :sort
    end
  end

  root to: 'media#movies_index'
end
