class Student < Admin
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_one_attached :avatar
end