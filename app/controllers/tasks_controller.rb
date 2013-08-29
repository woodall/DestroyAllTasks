class TasksController < ApplicationController


  def index
    @tasks = Task.all
    @task = Task.new

    respond_to do |format|
      format.html
    end
  end



  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html
    end
  end



  def new
    @task = Task.new

    respond_to do |format|
      format.html
    end
  end


  def edit
    @task = Task.find(params[:id])
  end



  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end


  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end



  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
    end
  end
end
