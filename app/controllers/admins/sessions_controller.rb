class Admins::SessionsController < Devise::SessionsController
  before_action :check_admin

  private

  def check_admin
    if current_student
      redirect_to students_homepage_path, alert: 'Unauthorized access for student'
    elsif current_teacher
      redirect_to teachers_homepage_path, alert: 'Unauthorized acces for teacher'
    end
  end
end
