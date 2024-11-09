class PostsController < ApplicationController
    def index
      @posts = Post.all
      @memos = Memo.all
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    def show
      @post=Post.find_by(params[:id])
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content, :start_time)
    end

    def memo_params
      params.require(:memo).permit(:title, :content)
    end
  end
  