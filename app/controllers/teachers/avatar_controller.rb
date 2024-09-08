class Teachers::AvatarController < Teachers::TeachersController

  def edit_avatar
  end

  def update_avatar
    unless params[:avatar].present?
      redirect_to teachers_edit_avatar_path, alert: 'select and image'
      return
    end
    if current_teacher.avatar.attach(params[:avatar])
      redirect_to teachers_edit_avatar_path, notice: 'Uploaded the image successfully!!!!'
    else
      redirect_to teachers_edit_avatar_path, alert: 'Some thing gone wrong'
    end
  end

  private

  def set_avatar_params
    params.require(:teacher).permit(:avatar)
  end
end