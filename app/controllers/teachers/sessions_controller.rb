class Teachers::SessionsController < Devise::SessionsController
  before_action :check_teacher

  private

  def check_teacher
    if current_admin || current_student
      if current_student
        redirect_to students_homepage_path, alert: 'Unauthorized access for student'
      elsif current_admin
        redirect_to admins_homepage_path, alert: 'Unauthorized access for admin page'
      end
    end
  end
end