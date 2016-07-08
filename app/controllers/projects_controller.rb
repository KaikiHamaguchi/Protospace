class ProjectsController < ApplicationController
  def index
  end

  def new

    @project = Project.new
    @project.thumbnails.build
  end


end
