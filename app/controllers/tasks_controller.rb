class TasksController < ApplicationController

  # GET: /tasks/new
  get "/tasks/new" do
    erb :"/tasks/new.html"
  end

  # POST: /tasks
  post "/tasks" do
    @task = Task.create(
      :user => current_user,
      :project => Project.find_by_id(params[:project_id]),
      :content => params[:content],
      :doneness => 0
    )
    redirect "/projects/#{params[:project_id]}"
  end

  # GET: /tasks/5/edit
  get "/tasks/:id/edit" do
    erb :"/tasks/edit.html"
  end

  # PATCH: /tasks/5
  patch "/tasks/:id" do
    redirect "/tasks/:id"
  end
# PATCH: /tasks/5
patch "/tasks/:id/move-up" do
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