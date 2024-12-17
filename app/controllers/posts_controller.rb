class PostsController < ApplicationController
  before_action :logged_in_user, except: [:index]
  def index
    @today_posts = Post.where('start_time LIKE ?', "#{Time.now.strftime( "%Y-%m-%d")}%")
    @today_memos = Memo.where('created_at LIKE ?', "#{Time.now.strftime( "%Y-%m-%d")}%")
    today = Date.today
    @every_day_posts = Post.where(important_status: 2).order(created_at: :desc)
    @important_posts = Post.where(important_status: 1).order(created_at: :desc)
    @unprocessed_posts = Post.where(created_at: today.beginning_of_day..today.end_of_day,status: 0, important_status: 0).order(created_at: :desc).limit(15)
    @progress_posts = Post.where(created_at: today.beginning_of_day..today.end_of_day,status: 1, important_status: 0).order(created_at: :desc).limit(15)
    @posts = Post.where.not(important_status: 2).where.not(status: 2)
    @one_diaries = OneDiary.all
    @memos = Memo.all
  end

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'タスクが作成されました'
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'タスクが更新されました'
    else
      render :edit
    end
  end

  def edit
    @post = Post.find(params[:id])
    @posts = Post.all
  end

  def show
    @post=Post.find(params[:id])
  end

  def all

    @posts = Post.all
    if params[:input_important] != "" && params[:input_important].present?
      @posts = @posts.where(important_status: params[:input_important])
    end
    if params[:input_status] != "" && params[:input_status].present?
      @posts = @posts.where(status: params[:input_status])
    end  
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other, notice: "タスクが削除されました" }
      format.json { head :no_content }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :status, :start_time, :important_status, :input_status, :input_important, :tag_content)
  end

  def memo_params
    params.require(:memo).permit(:title, :content)
  end
end
  