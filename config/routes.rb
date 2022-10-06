Rails.application.routes.draw do
  devise_for :users
  # public recipes path
  get 'public_recipes', to: 'recipes#public'
  get 'shopping_lists', to: 'recipe_foods#shopping_list'
  resources :recipes, only: [:index, :create, :show, :destroy, :new] do
    resources :recipe_foods, only: [:index, :create, :show, :destroy, :new, :update, :edit]
  end
  resources :foods, only: %i[index create show  destry new]

  root to: "foods#index"

end
