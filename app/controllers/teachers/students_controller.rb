class Teachers::StudentsController < Teachers::TeachersController
  def index
    # debugger
    @students = Student.includes(enrollments: :course)
    # debugger
    # course=[]
    # debugger
    # si.enrollments.each { |n| << Course.find_by(id: n.course_id).name }
  end
end