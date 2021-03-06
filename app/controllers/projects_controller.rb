class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_project, only: [:show, :destroy, :edit, :update]

  def index
    @projects = Project.order("created_at").page(params[:page]).per(8)
  end

  def new
    @project = Project.new
    @project.thumbnails.build
  end

  def create
    @project = Project.new(params_project)
    if @project.save
      redirect_to root_path, notice: 'Prototype was successfully create'
    else
      render :new
    end
  end

  def show
    @comment = @project.comments.build
    @comments = Comment.all
    @like = Like.find_by(user_id: current_user.id, project_id: params[:id])
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
      ).merge(user_id: current_user.id, tag_list: params[:project][:tag])
  end


end
