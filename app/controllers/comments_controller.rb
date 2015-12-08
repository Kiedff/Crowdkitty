class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = Comment.new(comment_params.merge(project_id:params[:project_id]))
    @comment.user_id = current_user.id if current_user
    if @comment.save
      flash[:success] = "Comment added!"
      
    else
      render 'new'
    end
    redirect_to project_path(params[:project_id])
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to project_path(params[:project_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

end