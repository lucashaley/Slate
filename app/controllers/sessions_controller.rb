class SessionsController < ApplicationController
  def create
    log_in params[:session][:student_number]
    redirect_to root_path
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_comment
    #   @comment = Comment.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def session_params
      params.require(:session).permit(:student_number)
    end
end
