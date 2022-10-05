Rails.application.routes.draw do
  resources :recipes, only: [index, create, show, destroy, new]
  resources :users 
  resources :foods, only: %i[index create show  destry new]

end
