class Student < Admin
  has_many :enrollments
  has_many :courses, through: :enrollments
end