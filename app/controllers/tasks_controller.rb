class TasksController < ApplicationController
    
  def index
    tasks = Task.all
    render json: tasks
  end

  def create
    task = Task.create(task_params)
      if task.valid?
        render json: task
      else 
        render json: task.errors, status: 422
      end
  end
  
  def update
    task = Task.find(params[:id])
    task.update(task_params)
      if task.valid?
        render json: task
      else
        render json: task.errors, status: 422
      end
  end
    
  def destroy
    task = Task.find(params[:id])
    tasks = Task.all
    if task.destroy
      render json: tasks, status: 410
    else
      render json: apartment.errors  
    end  
  end

  private
  def task_params
    params.require(:task).permit(:area, :item, :picture, :task_name, :task_descr, :frequency, :due_date, :user_id)
  end

end
