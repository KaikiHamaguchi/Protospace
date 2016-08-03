class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :destroy, :edit, :update]

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
  end

  def destroy
    if @project.user_id == current_user.id
       @project.destroy
    end
    redirect_to projects_path, notice: 'Prototype was successfully deleted.'
  end

  def edit
  end

  def update
    if @project.user_id == current_user.id
       @project.update(params_project)
    end
    redirect_to projects_path, notice: 'Prototype was successfully updated.'
  end

  def set_project
    @project  = Project.find(params[:id])
  end
  private
  def params_project
    params.require(:project).permit(
      :title,
      :catch_copy,
      :concept,
      thumbnails_attributes:[:id, :image_url, :status]
      ).merge(user_id: current_user.id)
  end


end
