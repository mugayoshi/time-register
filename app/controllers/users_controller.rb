class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @department = Department.find(@user.department_id)
    if @user.manager_id
      @manager = User.find(@user.manager_id)
    else
      # if the user themself is manager, display their own name in the page
      @manager = @user
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'Sign up success!'
      redirect_to @user
    else
      flash[:danger] = 'Sign up failed!'
      render :new
    end
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :department_id, :manager_id)
end