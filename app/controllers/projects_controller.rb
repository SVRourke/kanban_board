class ProjectsController < ApplicationController
  
  # GET: /projects/new
  get "/projects/new" do
    unauthorized_redirect
    erb :"/projects/new.html"
  end
  
  # POST: /projects
  post "/projects" do
  unauthorized_redirect

    if params[:title].length() > 0
      @project = Project.create(
        :title => params[:title],
        :description => params[:description],
        :user => current_user
      )
      redirect "/projects/#{@project.id}"
    else
      session[:errors] = []
      if params[:title].length() == 0
        session[:errors] << "Project Must Have Title"
      end

      if params[:description].length() == 0
        session[:errors] << "Project Must Have Description"
      end

      redirect "/projects/new"
    end
  end
  
  # GET: /projects/5
  get "/projects/:id" do
    unauthorized_redirect
    @project = Project.find_by_id(params[:id])
    erb :"/projects/show.html"
  end
  
  # GET: /projects/5/edit
  get "/projects/:id/edit" do
    unauthorized_redirect
    @project = Project.find_by_id(params[:id])
    erb :"/projects/edit.html"
  end
  
  # PATCH: /projects/5
  patch "/projects/:id" do
    unauthorized_redirect
    session[:errors] = Array.new()
    if params[:title].length() > 0 && params[:description].length() > 0
      @project = Project.find_by_id(params[:id])
      @project.update(:title => params[:title], :description => params[:description])
      redirect "/projects/#{@project.id}"
    else
      if params[:title].length == 0
        session[:errors] << "Title Cannot Be Blank"
      end
      if params[:description].length() == 0
        session[:errors] << "Description Cannot Be Blank"
      end
      redirect back
    end
  end
  
  # DELETE: /projects/5/delete
  delete "/projects/:id/delete" do
    unauthorized_redirect
    @project = Project.find_by_id(params[:id])
    @project.destroy
    redirect "/"
  end
end
