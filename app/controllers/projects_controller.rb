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
    redirect_to projects_path
  end

  def show
    @comment = @project.comments.build
    @comments = Comment.all
    @like = Like.find_by(user_id: current_user.id)
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


  private
  def set_project
    @project  = Project.find(params[:id])
  end

  def params_project
    params.require(:project).permit(
      :title,
      :catch_copy,
      :concept,
      thumbnails_attributes:[:id, :image_url, :status]
      ).merge(user_id: current_user.id)
  end


end
