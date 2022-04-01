class PitchesController < ApplicationController
  before_action :set_pitch, only: %i[ show edit update destroy ]

  # GET /pitches or /pitches.json
  def index
    @pitches = Pitch.all
  end

  # GET /pitches/1 or /pitches/1.json
  def show
    # this doesn't work because the view tries to list the new creative, and comes up empty
    # @new_creative = @pitch.creatives.build
  end

  # GET /pitches/new
  def new
    @pitch = Pitch.new
    # @pitch = current_user.pitches.build
  end

  # GET /pitches/1/edit
  def edit
  end

  # POST /pitches or /pitches.json
  def create
    logger.warn "\n\nCurrent User: #{current_user.inspect}\n\n"
    # @pitch = Pitch.new(pitch_params)
    @pitch = current_user.pitches.build(pitch_params)
    # @pitch.core_creatives.build({user: current_user, position: "mung"})
    logger.warn "\n\nPitch: #{@pitch.inspect}"
    logger.warn "\n\nCore Creatives: #{@pitch.creatives.inspect}\n\n"

    respond_to do |format|
      if @pitch.save
        format.html { redirect_to pitch_url(@pitch), notice: "Pitch was successfully created." }
        format.json { render :show, status: :created, location: @pitch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pitches/1 or /pitches/1.json
  def update
    logger.warn("CURRENT USER: " + current_user.inspect)
    respond_to do |format|
      if @pitch.update(pitch_params)
        format.html { redirect_to pitch_url(@pitch), notice: "Pitch was successfully updated." }
        format.json { render :show, status: :ok, location: @pitch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pitches/1 or /pitches/1.json
  def destroy
    @pitch.destroy

    respond_to do |format|
      format.html { redirect_to pitches_url, notice: "Pitch was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  def convert
    logger.warn "CONVERT!! #{params}"
    @pitch = Pitch.new
    @pitch.user = current_user
    @pitch.idea = Idea.find(params[:pitch_id])
    @pitch.title = @pitch.idea.title
    @pitch.synopsis = @pitch.idea.content
    @pitch.creatives.build
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pitch
      @pitch = Pitch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pitch_params
      params.require(:pitch).permit(:synopsis, :slides, :presentation_datetime, :user_id, :title, :tagline, :logline, :idea_id, :brief_id, creatives_attributes: [:pitch_id, :user_id, :position])
    end
end
