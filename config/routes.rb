Rails.application.routes.draw do
  resources :movies do
    collection do
      patch :sort
    end
  end

  root to: 'movies#index'
end
