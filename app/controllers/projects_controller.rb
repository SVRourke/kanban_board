class ProjectsController < ApplicationController

  # GET: /projects
  # get "/projects" do
  #   erb :"/projects/index.html"
  # end

  # GET: /projects/new
  get "/projects/new" do
    erb :"/projects/new.html"
  end

  # POST: /projects
  post "/projects" do
    if !params[:title].nil?
      @project = Project.create(
        :title => params[:title],
        :description => params[:description],
        :user => current_user
      )
      
      redirect "/projects/#{@project.id}"
    else
      redirect "/projects/new"
    end
  end

  # GET: /projects/5
  get "/projects/:id" do
    @project = Project.find_by_id(params[:id])
    erb :"/projects/show.html"
  end

  # GET: /projects/5/edit
  get "/projects/:id/edit" do
    @project = Project.find_by_id(params[:id])
    erb :"/projects/edit.html"
  end

  # PATCH: /projects/5
  patch "/projects/:id" do
    @project = Project.find_by_id(params[:id])
    @project.update(params[:project_params])
    redirect "/projects/:id"
  end

  # DELETE: /projects/5/delete
  delete "/projects/:id/delete" do
    @project = Project.find_by_id(params[:id])
    @project.destroy
    redirect "/"
  end
end
