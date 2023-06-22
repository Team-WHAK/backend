class TasksController < ApplicationController
    def create
        task = Task.create(task_params)
        if task.valid?
            render json: task
        else 
            render json: task.errors, status: 422
        end
    end
    
    private
    
    def task_params
        params.require(:task).permit(:area, :item, :picture, :task_name, :task_descr, :frequency, :due_date)
    end
end
