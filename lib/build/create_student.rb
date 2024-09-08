require_relative '../../config/environment'

module Build
  # Class used to build the seed data to the database.
  class StudentsBuilder
    # @return It destroyes all the records from the user table
    def reset_data
      Student.destroy_all
    end

    # @return It creates 10 user with all the attributes required using the factorybot
    def create_users
      10.times do |num|
        if num.even?
          FactoryBot.create(:student, category: 'inactive')
        else
          FactoryBot.create(:student)
        end
      end
    end

    # @return This executes the above two methods which are defined above
    def execute
      reset_data
      create_users
    end

    # @return This runs the execute method
    def run
      execute
    end
  end
end