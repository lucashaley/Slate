module SessionsHelper
  # def log_in(student_number)
  #   session[:student_number] = student_number
  #   session[:current_user] = User.find_by_student_number(student_number)
  # end
  #
  # def log_out
  #   session.delete(:student_number)
  #   session.delete(:current_user)
  #   @current_student = nil
  # end

  def current_student
    @current_student ||= session[:student_number]
    # @current_user ||= User.find_by_student_number(session[:student_number]) if !!session[:student_number]
  end

  def current_user
    @current_user ||= User.find_by_student_number(session[:student_number]) if !!session[:student_number]
  end

  def logged_in?
    # !current_student.nil?
    # !!session[:student_number]
    !current_user.nil?
  end
end
