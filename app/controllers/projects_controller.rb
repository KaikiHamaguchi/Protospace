class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @project.thumbnails.build
  end

  def create
    Project.create(params_project)
  end

  def show
    @project  = Project.find(params[:id])
  end

  private
  def params_project
    params.require(:project).permit(
      :title,
      :catch_copy,
      :concept,
      thumbnails_attributes:[:image_url, :status]
      ).merge(user_id: current_user.id)
  end

end
