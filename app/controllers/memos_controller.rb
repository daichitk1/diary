class MemosController < ApplicationController
  before_action :logged_in_user
  before_action :set_memo, only: %i[ show edit update destroy ]

  # GET /memos or /memos.json
  def index
    if params[:query].present?
      @memos = Memo.where("title LIKE ? OR content LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @memos = Memo.all
    end
  end

  # GET /memos/1 or /memos/1.json
  def show
  end

  # GET /memos/new
  def new
    @memo = Memo.new
    @memo.title = Date.today.strftime("%Y-%m-%d")  # titleに今日の日付を設定
    @memos = Memo.all
  end

  # GET /memos/1/edit
  def edit
  end

  # POST /memos or /memos.json
  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      flash[:notice] = "メモの作成に成功しました"
      redirect_to memo_path(@memo), status: :see_other
    end
  end

  # PATCH/PUT /memos/1 or /memos/1.json
  def update
    if @memo.update(memo_params)
      flash[:notice] = "メモの更新に成功しました"
      redirect_to memo_path(@memo), status: :see_other
    else
      flash.now[:notice] = "日記の更新に失敗しました"
      render :edit
    end
  end
  

  def destroy
    if @memo.destroy
      flash[:danger] = "メモの削除に成功しました"
      redirect_to memos_path, status: :see_other
    end
  end 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memo
      @memo = Memo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def memo_params
      params.require(:memo).permit(:title, :content, :query, :page)
    end
end
