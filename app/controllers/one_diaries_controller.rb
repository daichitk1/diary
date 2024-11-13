class OneDiariesController < ApplicationController
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
  end

  # GET /one_diaries/1/edit
  def edit
  end

  # POST /one_diaries or /one_diaries.json
  def create
    @one_diary = OneDiary.new(one_diary_params)

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
      params.require(:one_diary).permit(:title, :content, :date)
    end
end
