class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @projects = @user.projects.order('created_at desc').page(params[:page]).per(8)
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_params)
       redirect_to root_path, flash: { success: 'Yes!! Success' }
    else
       redirect_to edit_user_path, flash: { danger: 'Invalid Email' }
    end
  end

  private

  def update_params
   params.require(:user).permit(:name, :email, :password, :profile_image, :member, :profile, :works)
  end
end
