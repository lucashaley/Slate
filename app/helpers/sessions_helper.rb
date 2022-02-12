module SessionsHelper
  def log_in(student_id)
    session[:student_id] = student_id
  end

  def log_out
    session.delete(:student_id)
    @current_student = nil
  end

  def current_student
    @current_student ||= session[:student_id]
  end

  def logged_in?
    !current_student.nil?
  end
end
