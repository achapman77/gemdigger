class CommentsController < ApplicationController


  def index
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build( comment_params )
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render 'posts/show'
    end
  end

  def edit
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
      :post_id,
    )
  end

end
