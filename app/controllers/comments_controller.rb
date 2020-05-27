class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def index
    @comment = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new()
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "New comment created!"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def destroy 
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content)
  end
  
end
