class Admins::SessionsController < Devise::SessionsController
  before_action :check_admin

  private 

  def check_admin
    # debugger
    return unless current_student
    redirect_to admins_homepage_path, alert: 'Unauthorized acces'
  end
end