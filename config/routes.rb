Rails.application.routes.draw do
  # Routes for the Loan resource:
  # CREATE
  get "/loans/new", :controller => "loans", :action => "new"
  post "/create_loan", :controller => "loans", :action => "create"

  # READ
  get "/loans", :controller => "loans", :action => "index"
  get "/loans/:id", :controller => "loans", :action => "show"

  # UPDATE
  get "/loans/:id/edit", :controller => "loans", :action => "edit"
  post "/update_loan/:id", :controller => "loans", :action => "update"

  # DELETE
  get "/delete_loan/:id", :controller => "loans", :action => "destroy"
  #------------------------------

  # Routes for the Equipment resource:
  # CREATE
  get "/equipment/new", :controller => "equipment", :action => "new"
  post "/create_equipment", :controller => "equipment", :action => "create"

  # READ
  get "/equipment", :controller => "equipment", :action => "index"
  get "/equipment/:id", :controller => "equipment", :action => "show"

  # UPDATE
  get "/equipment/:id/edit", :controller => "equipment", :action => "edit"
  post "/update_equipment/:id", :controller => "equipment", :action => "update"

  # DELETE
  get "/delete_equipment/:id", :controller => "equipment", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
