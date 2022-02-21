module SessionsHelper
  def log_in(student_number)
    session[:student_number] = student_number
  end

  def log_out
    session.delete(:student_number)
    @current_student = nil
  end

  def current_student
    @current_student ||= session[:student_number]
  end

  def logged_in?
    !current_student.nil?
  end
end
