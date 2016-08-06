class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    @project = Project.find(params[:project_id])
    @comments = @project.comments.all
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, project_id: params[:project_id])
  end
end
