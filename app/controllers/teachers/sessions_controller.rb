class Teachers::SessionsController < Devise::SessionsController
  before_action :check_teacher

  private 

  def check_teacher
    # debugger
    return unless current_student
    redirect_to teachers_homepage_path, alert: 'Unauthorized access'
  end
end