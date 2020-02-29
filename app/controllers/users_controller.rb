class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録完了"
      redirect_to root_path
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end