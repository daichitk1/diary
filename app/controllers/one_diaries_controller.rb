class OneDiariesController < ApplicationController
  before_action :logged_in_user
  before_action :set_one_diary, only: %i[ show edit update destroy ]

  # GET /one_diaries or /one_diaries.json
  def index
    @one_diaries = OneDiary.all

  end

  # GET /one_diaries/1 or /one_diaries/1.json
  def show
  end

  # GET /one_diaries/new
  def new
    @one_diary = OneDiary.new
    @today_posts = Post.where('start_time LIKE ?', "#{Time.now.strftime( "%Y-%m-%d")}%")
    @today_memos = Memo.where('created_at LIKE ?', "#{Time.now.strftime( "%Y-%m-%d")}%")

  end

  # GET /one_diaries/1/edit
  def edit
    @today_posts = Post.where('start_time LIKE ?', "#{Time.now.strftime( "%Y-%m-%d")}%")
    @today_memos = Memo.where('created_at LIKE ?', "#{Time.now.strftime( "%Y-%m-%d")}%")

  end

  # POST /one_diaries or /one_diaries.json
  def create
    @one_diary = OneDiary.new(one_diary_params)
    @one_diary.images.attach(params[:images])
    respond_to do |format|
      if @one_diary.save
        format.html { redirect_to @one_diary, notice: "One diary was successfully created." }
        format.json { render :show, status: :created, location: @one_diary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @one_diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /one_diaries/1 or /one_diaries/1.json
  def update
    @one_diary.images.attach(params[:images])
    respond_to do |format|
      if @one_diary.update(one_diary_params)
        format.html { redirect_to @one_diary, notice: "One diary was successfully updated." }
        format.json { render :show, status: :ok, location: @one_diary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @one_diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /one_diaries/1 or /one_diaries/1.json
  def destroy
    @one_diary.destroy!

    respond_to do |format|
      format.html { redirect_to one_diaries_path, status: :see_other, notice: "One diary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_one_diary
      @one_diary = OneDiary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def one_diary_params
      params.require(:one_diary).permit(:title, :content, :date, :query, images: [])
    end
end
