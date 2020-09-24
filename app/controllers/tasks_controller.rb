class TasksController < ApplicationController

  # GET: /tasks/new
  get "/tasks/new" do
    unauthorized_redirect
    erb :"/tasks/new.html"
  end

  # POST: /tasks
  post "/tasks" do
    unauthorized_redirect
    @project = Project.find_by_id(params[:project_id])
    @task = Task.new(
      :user => current_user,
      :project => @project,
      :content => params[:content],
      :doneness => 0
    )
    if @task.valid?
      @task.save
      redirect "/projects/#{params[:project_id]}"
    
    else
      session[:errors] = Hash(@task.errors)
      redirect back
    end
  end

  # GET: /tasks/5/edit
  get "/tasks/:id/edit" do
    unauthorized_redirect
    @task = Task.find_by_id(params[:id])
    erb :"/tasks/edit.html"
  end

  # PATCH: /tasks/5
  patch "/tasks/:id" do
    unauthorized_redirect
    if params[:task][:content].length() > 0
      @task = Task.find_by_id(params[:id])
      @task.update(params[:task])
      redirect "/projects/#{@task.project_id}"
    else
      session[:errors] << "Cannot Save Blank Task"
      redirect back
    end
  end

  # PATCH: /tasks/5
  patch "/tasks/:id/move-up" do
    unauthorized_redirect
    @task = Task.find_by_id(params[:id])
    current_stage = @task.doneness.to_i
    if @task.doneness.to_i < 2
      @task.update(:doneness => current_stage += 1)
      redirect back
    else
      redirect back
    end
  end

  # DELETE: /tasks/5/delete
  delete "/tasks/:id/delete" do
    unauthorized_redirect
    @task = Task.find_by_id(params[:id])
    @task.destroy
    redirect back
  end
end