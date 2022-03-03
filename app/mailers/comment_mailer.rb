class CommentMailer < ApplicationMailer
  default from: 'l.haley@massey.ac.nz'

  def new_comment
    @comment = params[:comment]
    logger.debug "DOCKHOLE: #{@comment.student_number}"
    @user = User.find_by student_number: @comment.student_number.to_i
    logger.debug "PANTS: #{@user.inspect}"
    mail(
      to: @user.email,
      subject: 'New Comment'
    )
  end
end
