class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
    @project.thumbnails.build
  end

  def create
    Project.create(params_project)
  end

  private
  def params_project
    params.require(:project).permit(:title, :catch_copy, :concept, thumbnails_attributes: [:image_url, :classification])
  end

end
