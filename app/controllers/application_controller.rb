require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions

    # unsafe secret, used to simplify development
    set :session_secret, 'Development'
    # For better security, create an environement variable "SESSION_SECRET" set the value to SecureRandom.hex(64)
    # set :session_secret, ENV.fetch('SESSION_SECRET')
  end

  get "/" do
    unauthorized_redirect
    redirect "/users/#{session[:user_id]}"
  end
  # -----------------------------
  # login
  # -----------------------------
  get "/login" do
    erb :login
  end
  
  post "/login" do
    puts params
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/"
    else
      redirect back
    end
  end

  get "/logout" do
    unauthorized_redirect
    session.clear
    redirect "/login"
  end
  
  
  # -----------------------------
  # signup
  # -----------------------------
  get "/signup" do
    erb :signup
  end

  post "/signup" do
    if !User.find_by_username(params[:username]) && !User.find_by_email(params[:email])
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect "/"
    else
      redirect "/signup"
    end
  end

  def unauthorized_redirect
    if !logged_in?
      redirect "/login"
    end
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    if logged_in?
      User.find_by_id(session[:user_id])
    end
  end
end

