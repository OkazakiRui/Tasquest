class TasksController < ApplicationController
  
  PENALTY = %w[親に電話する コーラ一気飲み 語尾に「にゃん」をつける 出会った人に一発芸をする 1日間1番上の写真をLINEのアイコンにする]
  
  def index 
    @tasks = Task.where(status: '未受注').all
  end
  
  def started_tasks
    @tasks = Task.where(status: '進行中').all
    render 'start'
  end
  
  def finished_tasks
    @tasks = Task.where(status: '達成').all
    render 'finish'
  end
  
  def failed_tasks
    @tasks = Task.where(status: '失敗').all
    render 'failure'
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = current_user.tasks.build(task_params.merge(penalty: PENALTY.sample, status: '未受注'))
    if @task.save(task_params)
      redirect_to action: "index"
    else
      render "new"
    end
  end
  
  def start
    @task = Task.find(params[:id])
    @task.status = '進行中'
    @task.save
    redirect_to action: "started_tasks"
  end
  
  def finish
    @task = Task.find(params[:id])
    @task.status = '達成'
    @task.save
    redirect_to action:  "index"
  end
  
  def failure
    @task = Task.find(params[:id])
    @task.status = '失敗'
    @task.save
    redirect_to action: "failed_tasks"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params.merge(penalty: PENALTY.sample))
      redirect_to action: "show"
    else
      render "edit"
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :deadline, :priority, :detail)
    end
end