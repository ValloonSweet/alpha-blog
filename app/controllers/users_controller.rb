class UsersController < ApplicationController

  def new
    @user = User.new
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

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
