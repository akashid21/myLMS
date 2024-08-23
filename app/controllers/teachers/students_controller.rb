class Teachers::StudentsController < Teachers::TeachersController
  def index
    @students = Student.all
    course=[]
    # si.enrollments.each { |n| << Course.find_by(id: n.course_id).name }
  end
end