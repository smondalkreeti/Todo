class TasksController < ApplicationController
  before_action :find_task, except: [:new, :create, :index]
  
  def index
    if params[:date].present?
      @tasks = Task.includes(:user).where(user_id: current_user, scheduled: params[:date])
    else 
      @tasks = Task.includes(:user).where(user_id: current_user).order_desc
    end
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(tasks_params)
    if @task.save
      redirect_to(user_tasks_path, flash: { success: "New todo added" })
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @task.destroy
    redirect_back(fallback_path: user_tasks_path(current_user), flash: { success: "Todo has been deleted"})
  end

  private

  def tasks_params
    params.require(:task).permit(:description, :scheduled, :status)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
