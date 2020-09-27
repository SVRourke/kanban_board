class UsersController < ApplicationController

  # GET: /users/5
  get "/users/:id" do
    unauthorized_redirect
    @user = current_user
    erb :"/users/show.html"
  end
  
  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    unauthorized_redirect
    @user = User.find_by(:id => params[:id])
    @user.destroy
    session[:user_id] = ""
    redirect "/signup"
  end
end
