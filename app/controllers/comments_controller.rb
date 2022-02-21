class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @user = User.find_by student_number: params[:student_number]
    @idea = Idea.find params[:idea_id]
    @comment = @idea.comments.create(comment_params)

    # TODO Add back when user model is complete
    # @comment.user = @user
    # @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        Rails.logger.debug("Saved!")
        CommentMailer.with(comment: @comment).new_comment.deliver_later
        format.html { redirect_to idea_url(@idea) }
        format.json { render :show, status: :created, location: @comment }
      else
        # format.html { render :new, status: :unprocessable_entity }
        logger.warn "#{@comment.errors.inspect}"
        format.html { redirect_to idea_url(@idea), status: :unprocessable_entity, notice: "Comment could not be created." }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        # format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.html { redirect_to idea_url(@comment.idea), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :student_number, :idea_id)
    end
end
