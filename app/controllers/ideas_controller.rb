class IdeasController < ApplicationController
  before_action :set_idea, only: %i[show edit update destroy]

  # GET /ideas or /ideas.json
  def index
    # @ideas = Idea.all
    @idea = Idea.new
    @q = Idea.ransack(params[:q])
    @ideas = @q.result(distinct: true).order('created_at DESC')
    @ideas = @ideas.filter_by_student_number(params[:student_number]) if params[:student_number].present?
    @ideas = @ideas.filter_by_realm(params[:realm_id]) if params[:realm_id].present?
    @ideas = @ideas.filter_by_user(current_user) if params[:bookmark].present?

    @realms = Realm.all
  end

  # GET /ideas/1 or /ideas/1.json
  def show
    # @comment = Comment.new
    @ratings_data = @idea.ratings.collect { |r| [r.impact, r.viability] }
    @is_owner = current_student.to_i == @idea.student_number
    @has_rated = @idea.ratings.exists?(student_number: current_student)
    @show_ratings_form = !@is_owner && !@has_rated
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit; end

  # POST /ideas or /ideas.json
  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user

    respond_to do |format|
      if @idea.save
        format.html { redirect_to ideas_url, notice: 'Idea was successfully created! Now do another!' }
        format.json { render :show, status: :created, location: @idea }
      else
        # format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1 or /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to idea_url(@idea), notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1 or /ideas/1.json
  def destroy
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_bookmark
    @idea = Idea.find_by(id: params[:id])

    # if current_user.favorited?(@idea)
    #   current_user.unfavorite(@idea)
    #   @icon = "bi-bookmark-plus"
    # else
    #   current_user.favorite(@idea)
    #   @icon = "bi-bookmark-check-fill"
    # end

    if current_user.marks.include? @idea
      current_user.marks.delete(@idea)
      @icon = 'bi-bookmark-plus'
    else
      current_user.marks << @idea
      @icon = 'bi-bookmark-check-fill'
    end
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_idea
    @idea = Idea.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def idea_params
    params.require(:idea).permit(:title, :content, :student_number, realm_ids: [], comment_ids: [], rating_ids: [],
                                                                    favorite_ids: [])
  end
end
