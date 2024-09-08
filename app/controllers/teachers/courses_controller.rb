class Teachers::CoursesController < Teachers::TeachersController
  before_action :set_course, only: %w[show]
  def index
    @courses = Course.includes(:students)
  end

  def show
    @students = @course.students
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end