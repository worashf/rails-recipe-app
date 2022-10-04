Rails.application.routes.draw do
  resources :recipes
  resources :users 
  resources :foods, only: %i[index create show  destry new]

end
