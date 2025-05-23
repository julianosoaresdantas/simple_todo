# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks
  def index
    @tasks = current_user.tasks # Still filter by current user
    authorize Task # Authorize the Task class for index action
  end

  # GET /tasks/1
  def show
    authorize @task # Authorize the specific @task instance
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build
    authorize @task # Authorize the new @task instance
  end

  # GET /tasks/1/edit
  def edit
    authorize @task # Authorize the specific @task instance
  end

  # POST /tasks
  def create
    @task = current_user.tasks.build(task_params)
    authorize @task # Authorize the new @task instance

    if @task.save
      redirect_to @task, notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    authorize @task # Authorize the specific @task instance
    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    authorize @task # Authorize the specific @task instance
    @task.destroy
    redirect_to tasks_url, notice: "Task was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to tasks_url, alert: "Task not found or unauthorized."
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :status)
    end
end
