Rails.application.routes.draw do
resources :users 
resources :foods, only: %i[index create show  destry new]

end
