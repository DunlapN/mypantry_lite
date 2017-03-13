Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "recipes#index"
  # Routes for the Food resource:
  # CREATE
  get "/foods/new", :controller => "foods", :action => "new"
  post "/create_food", :controller => "foods", :action => "create"

  # READ
  get "/foods", :controller => "foods", :action => "index"
  get "/foods/:id", :controller => "foods", :action => "show"

  # UPDATE
  get "/foods/:id/edit", :controller => "foods", :action => "edit"
  post "/update_food/:id", :controller => "foods", :action => "update"

  # DELETE
  get "/delete_food/:id", :controller => "foods", :action => "destroy"
  #------------------------------

  # Routes for the Ingredient resource:
  # CREATE
  get "/ingredients/new", :controller => "ingredients", :action => "new"
  post "/create_ingredient", :controller => "ingredients", :action => "create"

  # READ
  get "/ingredients", :controller => "ingredients", :action => "index"
  get "/ingredients/:id", :controller => "ingredients", :action => "show"

  # UPDATE
  get "/ingredients/:id/edit", :controller => "ingredients", :action => "edit"
  post "/update_ingredient/:id", :controller => "ingredients", :action => "update"

  # DELETE
  get "/delete_ingredient/:id", :controller => "ingredients", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Pantries_item resource:
  # CREATE
  get "/pantries_items/new", :controller => "pantries_items", :action => "new"
  post "/create_pantries_item", :controller => "pantries_items", :action => "create"

  # READ
  get "/pantries_items", :controller => "pantries_items", :action => "index"
  get "/pantries_items/:id", :controller => "pantries_items", :action => "show"

  # UPDATE
  get "/pantries_items/:id/edit", :controller => "pantries_items", :action => "edit"
  post "/update_pantries_item/:id", :controller => "pantries_items", :action => "update"

  # DELETE
  get "/delete_pantries_item/:id", :controller => "pantries_items", :action => "destroy"
  #------------------------------

  # Routes for the Recipe resource:
  # CREATE
  get "/recipes/new", :controller => "recipes", :action => "new"
  post "/create_recipe", :controller => "recipes", :action => "create"

  # READ
  get "/recipes", :controller => "recipes", :action => "index"
  get "/recipes/:id", :controller => "recipes", :action => "show"

  # UPDATE
  get "/recipes/:id/edit", :controller => "recipes", :action => "edit"
  post "/update_recipe/:id", :controller => "recipes", :action => "update"

  # DELETE
  get "/delete_recipe/:id", :controller => "recipes", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
