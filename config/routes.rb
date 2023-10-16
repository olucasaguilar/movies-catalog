Rails.application.routes.draw do
  root to: 'home#index'

  resources :movie_genres, only: [:index, :new, :create, :edit, :update]
end
