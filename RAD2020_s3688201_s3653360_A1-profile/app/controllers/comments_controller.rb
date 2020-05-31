class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def index
    @comment = Comment.all
    @users = User.all
    @comments = Comment.where("created_at >= ?", 1.month.ago.utc).order(created_at: :desc)
    @recentcomment= Comment.order(updated_at: :desc).limit(10)
  end

  def show
    @comment = Comment.find(params[:id])
    @users = User.all
    @recentcomment= Comment.order(updated_at: :desc).limit(10)
    
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
