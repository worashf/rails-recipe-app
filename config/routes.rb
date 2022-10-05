Rails.application.routes.draw do
  devise_for :users
  resources :recipes

  resources :foods, only: %i[index create show  destry new]

  root to: "foods#index"

end
