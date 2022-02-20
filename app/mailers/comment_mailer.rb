class CommentMailer < ApplicationMailer
  default from: 'l.haley@massey.ac.nz'

  def new_comment
    @comment = params[:comment]
    logger.debug "DOCKHOLE: #{@comment.student_id.to_s}"
    @user = User.find_by student_id: @comment.student_id.to_i
    logger.debug "PANTS: #{@user.inspect}"
    mail(
      to: @user.email,
      subject: "New Comment"
    )
  end
end
