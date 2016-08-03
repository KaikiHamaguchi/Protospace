class UsersController < ApplicationController

  def show
    @project = Project.where(params[:id])
  end

  def update
    if current_user.update(update_params)
       redirect_to user_path, flash: { success: 'Yes!! Success' }
    else
       redirect_to edit_user_path, flash: { danger: 'Invalid Email' }
    end
  end

  private

  def update_params
   params.require(:user).permit(:name, :email, :profile_image, :member, :profile, :works)
  end
end
