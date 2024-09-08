class Students::EnrollmentsController < Students::StudentsController
  def index
    # debugger
    @enrollments = current_student.enrollments.includes(:course)
  end

  def create
    @enollment = current_student.enrollments.new
    @enollment.course_id = params[:course_id]
    if @enollment.save
      redirect_to students_all_courses_path, notice: 'Enrolled successfully'
    else
      redirect_to students_courses_path, alert: 'Something went wrong....'
    end
  end
end