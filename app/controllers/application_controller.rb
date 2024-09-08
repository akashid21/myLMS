class ApplicationController < ActionController::Base
  before_action :admin_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource.type
    when 'Teacher'
      teachers_homepage_path
    when 'Student'
      students_homepage_path
    end
  end

  private

  def admin_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name age role])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name age role])
  end
end
