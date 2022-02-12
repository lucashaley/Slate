class RealmsController < ApplicationController
  before_action :set_realm, only: %i[ show edit update destroy ]

  # GET /realms or /realms.json
  def index
    @realms = Realm.all
  end

  # GET /realms/1 or /realms/1.json
  def show
  end

  # GET /realms/new
  def new
    @realm = Realm.new
  end

  # GET /realms/1/edit
  def edit
  end

  # POST /realms or /realms.json
  def create
    @realm = Realm.new(realm_params)

    respond_to do |format|
      if @realm.save
        format.html { redirect_to realm_url(@realm), notice: "Realm was successfully created." }
        format.json { render :show, status: :created, location: @realm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @realm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /realms/1 or /realms/1.json
  def update
    respond_to do |format|
      if @realm.update(realm_params)
        format.html { redirect_to realm_url(@realm), notice: "Realm was successfully updated." }
        format.json { render :show, status: :ok, location: @realm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @realm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /realms/1 or /realms/1.json
  def destroy
    @realm.destroy

    respond_to do |format|
      format.html { redirect_to realms_url, notice: "Realm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realm
      @realm = Realm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def realm_params
      params.require(:realm).permit(:title, :color)
    end
end
