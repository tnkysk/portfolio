class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update]

  def top
  end

  def index
    @users = User.all
    @user = current_user
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
       redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
    else
       render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
