Rails.application.routes.draw do
  resources :media do
    collection do
      patch :sort
    end
  end

  root to: 'media#index'
end
