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
    erb :welcome
  end

  # login
  # signup

end
