class DevelopmentsController < ApplicationController
  before_action :set_development, only: %i[ show edit update destroy ]

  # GET /developments or /developments.json
  def index
    @developments = Development.all
  end

  # GET /developments/1 or /developments/1.json
  def show
  end

  # GET /developments/new
  def new
    @development = Development.new
  end

  # GET /developments/1/edit
  def edit
  end

  # POST /developments or /developments.json
  def create
    @development = Development.new(development_params)
    if @development.save
      flash[:notice] = "開発の作成に成功しました"
      redirect_to @development
    else
      flash.now[:notice] = "開発の作成に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /developments/1 or /developments/1.json
  def update
    if @development.update(development_params)
      flash[:notice] = "開発の更新に成功しました"
      redirect_to @development
    else
      flash.now[:danger] = "開発の更新に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /developments/1 or /developments/1.json
  def destroy
    if @development.destroy!
      flash[:danger] = "開発の削除に成功しました"
      redirect_to developments_path, status: :see_other
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_development
      @development = Development.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def development_params
      params.require(:development).permit(:title, :content)
    end
end
