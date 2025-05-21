# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  # This line ensures that a user must be logged in to access any task-related actions.
  # If you want some actions (like index) to be public, you can add:
  # skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_user!

  # GET /tasks
  # Displays a list of all tasks.
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # Displays details for a single task.
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  # Displays a form to create a new task.
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  # Displays a form to edit an existing task.
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # Creates a new task with the submitted parameters.
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: "Task was successfully created."
    else
      # If saving fails, re-render the new task form with error messages.
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  # Updates an existing task with the submitted parameters.
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      # If updating fails, re-render the edit task form with error messages.
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  # Deletes a specific task.
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # Redirect to the tasks list with a success message.
    redirect_to tasks_url, notice: "Task was successfully destroyed."
  end

  private

  # Defines the allowed parameters for creating or updating a task.
  # This is a security feature to prevent Mass Assignment Vulnerabilities.
  def task_params
    params.require(:task).permit(:title, :description, :completed, :due_date)
  end
end
