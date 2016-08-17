class TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def show
    @projects = Project.tagged_with(ActsAsTaggableOn::Tag.find(params[:id]))
  end

end
