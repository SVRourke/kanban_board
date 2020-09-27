class UsersController < ApplicationController
  
  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    unauthorized_redirect
    @user = User.find_by(:id => params[:id])
    @user.destroy
    session[:user_id] = ""
    redirect "/signup"
  end
end
