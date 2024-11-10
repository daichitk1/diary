class PostsController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update]
    def index
      today = Date.today
      @unprocessed_posts = Post.where(created_at: today.beginning_of_day..today.end_of_day,status: 0).order(created_at: :desc).limit(5)
      @progress_posts = Post.where(created_at: today.beginning_of_day..today.end_of_day,status: 1).order(created_at: :desc).limit(5)
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

    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def show
      @post=Post.find_by(params[:id])
    end

    def all
      today = Date.today
      @posts = Post.all
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy!
  
      respond_to do |format|
        format.html { redirect_to posts_path, status: :see_other, notice: "Memo was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content, :status, :start_time)
    end

    def memo_params
      params.require(:memo).permit(:title, :content)
    end
  end
  