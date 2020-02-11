class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
#taskモデルの一覧を取得
end
