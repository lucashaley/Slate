class RatingsController < ApplicationController
  before_action :set_rating, only: %i[update destroy]

  # GET /comments/new
  def new
    @rating = Rating.new
  end

  # POST /comments or /comments.json
  def create
    # @user = User.find_by student_number: params[:student_number]
    @idea = Idea.find params[:idea_id]
    @rating = @idea.ratings.create(rating_params)
    @rating.user = current_user

    # TODO: Add back when user model is complete
    # @comment.user = @user
    # @comment = Comment.new(comment_params)

    respond_to do |format|
      if @rating.save
        Rails.logger.debug('Saved!')
        format.html { redirect_to idea_url(@idea) }
        format.json { render :show, status: :created, location: @comment }
      else
        # format.html { render :new, status: :unprocessable_entity }
        logger.warn @rating.errors.inspect.to_s
        format.html do
          redirect_to idea_url(@idea), status: :unprocessable_entity, notice: 'Rating could not be created.'
        end
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rating
    @rating = Rating.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rating_params
    params.require(:rating).permit(:impact, :viability, :student_number, :idea_id)
  end
end
