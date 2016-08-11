class LikesController < ApplicationController

  before_action :set_project, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, project_id: params[:project_id])
    @project = Project.find_by(user_id: current_user.id)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, project_id: params[:project_id])
    @like.destroy
    @project = Project.find_by(user_id: current_user.id)
  end

  private

  def set_project
    @project  = Project.find(params[:project_id])
  end

end
