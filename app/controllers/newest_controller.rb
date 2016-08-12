class NewestController < ApplicationController

  def index
    @projects = Project.all
  end
end
