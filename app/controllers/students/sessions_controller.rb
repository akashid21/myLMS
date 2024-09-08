# frozen_string_literal: true

class Students::SessionsController < Devise::SessionsController
  before_action :check_student

  private

  def check_student
    if current_teacher || current_admin
      if current_admin
        redirect_to admins_homepage_path, alert: 'Unauthorizedsssss access.'
      elsif current_teacher
        redirect_to teachers_homepage_path, alert: 'Unauthorizedsssss access.'
      end
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
