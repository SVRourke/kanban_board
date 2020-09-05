class UsersController < ApplicationController

  # GET: /users/5
  get "/users/:id" do
    unauthorized_redirect
    @user = current_user
    erb :"/users/show.html"
  end
  
  # GET: /users/5/edit
  get "/users/:id/edit" do
    unauthorized_redirect
    erb :"/users/edit.html"
  end

  
  # PATCH: /users/5
  patch "/users/:id" do
    unauthorized_redirect
    redirect "/users/:id"
  end
  
  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    unauthorized_redirect
    redirect "/users"
  end
end

# GET: /users
# get "/users" do
#   erb :"/users/index.html"
# end

# GET: /users/new
# get "/users/new" do
#   erb :"/users/new.html"
# end

# POST: /users
# post "/users" do
#   redirect "/users"
# end