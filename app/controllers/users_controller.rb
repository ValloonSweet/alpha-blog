class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    debugger
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        flash[:success] = "User was successfully created"
        format.html { redirect_to articles_path }
      else
        format.html { render(:new, status: :unprocessable_entity) }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = "User was successfully updated"
        format.html { redirect_to articles_path }
      else
        format.html { render(:new, status: :unprocessable_entity) }
      end
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
