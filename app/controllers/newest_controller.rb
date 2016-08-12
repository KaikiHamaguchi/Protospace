class NewestController < ApplicationController

  def index
    @projects = Project.all.order('created_at')
  end
end
