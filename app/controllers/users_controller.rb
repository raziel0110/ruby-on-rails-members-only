class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      flash[:notice] = "User successfully created."
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    flash[:notice] = 'User removed.'
    redirect_to users_path
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
