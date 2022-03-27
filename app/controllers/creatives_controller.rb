class CreativesController < ApplicationController
  before_action :set_creative, only: %i[ show edit update destroy ]

  # GET /creatives or /creatives.json
  def index
    @creatives = Creative.all
  end

  # GET /creatives/1 or /creatives/1.json
  def show
  end

  # GET /creatives/new
  def new
    @creative = Creative.new
  end

  # GET /creatives/1/edit
  def edit
  end

  # POST /creatives or /creatives.json
  def create
    @creative = Creative.new(creative_params)

    respond_to do |format|
      if @creative.save
        format.html { redirect_to creative_url(@creative), notice: "Creative was successfully created." }
        format.json { render :show, status: :created, location: @creative }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @creative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creatives/1 or /creatives/1.json
  def update
    respond_to do |format|
      if @creative.update(creative_params)
        format.html { redirect_to creative_url(@creative), notice: "Creative was successfully updated." }
        format.json { render :show, status: :ok, location: @creative }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @creative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creatives/1 or /creatives/1.json
  def destroy
    @creative.destroy

    respond_to do |format|
      format.html { redirect_to creatives_url, notice: "Creative was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creative
      @creative = Creative.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def creative_params
      params.require(:creative).permit(:position, :user_id, :pitch_id)
    end
end
