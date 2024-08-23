class Students::CoursesController < Students::StudentsController
  def index
    @courses = Course.all
  end
end