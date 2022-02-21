class SessionsController < ApplicationController
  def create
    # log_in params[:session][:student_number]
    @user = User.find_by_student_number(params[:session][:student_number])
    if !!@user
      session[:student_number] = params[:session][:student_number]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      message = "Something went wrong!"
      redirect_to root_path, notice: message
    end
  end

  def destroy
    # log_out
    session.delete(:student_number)
    session.delete(:user_id)
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
