class PopularController < ApplicationController

  def index
    @projects = Project.all.order('likes_count DESC')
  end
end
