class PostsController < ApplicationController
    before_action :logged_in_user, only: [ :new, :create, :destroy]
    
    def show
      @post = Post.find(params[:id])
      @users = User.all
      @toppost = Post.order(view: :desc).limit(5)
      @recentpost= Post.order(updated_at: :desc).limit(12)
      @comment = @post.comments
    end

    def index
        @posts = Post.where("created_at >= ?", 1.month.ago.utc).order(created_at: :desc)
        @users = User.all
        @toppost = Post.order(view: :desc).limit(5)
        @recentpost= Post.order(updated_at: :desc).limit(12)
    end

    def new
      @post = Post.new()
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
          # flash[:success] = "New post created!"
          redirect_to root_url
        else
          render 'new'
        end
    end

    def destroy 
    end


  
    private

    def post_params
      params.permit(:title, :content, :topic)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
