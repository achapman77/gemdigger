class CommentsController < ApplicationController

  def destroy
    raise
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end

    redirect_to [@topic, @post]
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
      :post_id,
    )
  end

end