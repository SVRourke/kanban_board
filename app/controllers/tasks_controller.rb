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
    tasks_contents = @project.tasks.collect {|t| t.content}
    if params[:content].length() > 0 && !tasks_contents.any? {|t| t == params[:content]}
      @task = Task.create(
        :user => current_user,
        :project => @project,
        :content => params[:content],
        :doneness => 0
      )
      redirect "/projects/#{params[:project_id]}"
    else
      session[:errors] = []
      if  params[:content].length() == 0
        session[:errors] << "Task Cannot Be Blank."
      end

      if tasks_contents.any? {|t| t == params[:content]}
        session[:errors] << "Task Already In Project."
      end
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
    @task = Task.find_by_id(params[:id])
    @task.update(params[:task])
    redirect "/projects/#{@task.project_id}"
  end

  # PATCH: /tasks/5
  patch "/tasks/:id/move-up" do
    unauthorized_redirect
    @task = Task.find_by_id(params[:id])
    # binding.pry
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
# GET: /tasks
  # get "/tasks" do
  #   erb :"/tasks/index.html"
  # end

# GET: /tasks/5
  # get "/tasks/:id" do
  #   erb :"/tasks/show.html"
  # end