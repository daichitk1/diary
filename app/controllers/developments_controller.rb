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

    respond_to do |format|
      if @development.save
        format.html { redirect_to @development, notice: "開発の作成に成功しました" }
        format.json { render :show, status: :created, location: @development }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @development.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /developments/1 or /developments/1.json
  def update
    respond_to do |format|
      if @development.update(development_params)
        format.html { redirect_to @development, notice: "開発の更新に成功しました" }
        format.json { render :show, status: :ok, location: @development }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @development.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /developments/1 or /developments/1.json
  def destroy
    @development.destroy!

    respond_to do |format|
      format.html { redirect_to developments_path, status: :see_other, notice: "開発の削除に成功しました" }
      format.json { head :no_content }
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
