Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :create, :show, :destroy, :new]

  resources :foods, only: %i[index create show  destry new]

  root to: "foods#index"

end
