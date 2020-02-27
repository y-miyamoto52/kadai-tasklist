class TasksController < ApplicationController
  before_action :require_user_logged_in
  
  def index
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
  end

  def show
    set_tsk
  end

  def new
    if logged_in?
      @task = current_user.tasks.build 
    else
      
    end
  end

  def create
     @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = 'Task が正常に作成されました'
      redirect_to @task
    else
       flash.now[:danger] = 'Task が作成されませんでした'
       render :new
    end
  end

  def edit
     set_tsk
  end

  def update
    set_tsk

      if @task.update(task_params)
        flash[:success] = 'Task は正常に更新されました'
        redirect_to @task
      else
        flash.now[:danger] = 'Task は更新されませんでした'
        render :edit
      end
  end

  def destroy
    set_tsk
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end
  
  
private
  def set_tsk
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end

end