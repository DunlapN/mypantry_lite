Rails.application.routes.draw do
  # Routes for the Pantry resource:
  # CREATE
  get "/pantries/new", :controller => "pantries", :action => "new"
  post "/create_pantry", :controller => "pantries", :action => "create"

  # READ
  get "/pantries", :controller => "pantries", :action => "index"
  get "/pantries/:id", :controller => "pantries", :action => "show"

  # UPDATE
  get "/pantries/:id/edit", :controller => "pantries", :action => "edit"
  post "/update_pantry/:id", :controller => "pantries", :action => "update"

  # DELETE
  get "/delete_pantry/:id", :controller => "pantries", :action => "destroy"
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
