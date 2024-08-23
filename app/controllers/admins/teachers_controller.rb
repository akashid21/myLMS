class Admins::TeachersController < Admins::AdminsController
  def index
    @teachers = Teacher.where(role: 'teacher')
  end

  def show
    @teacher = Teacher.find_by(id: params[:id])
  end
end