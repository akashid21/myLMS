require_relative '../../config/environment'

module Build
  # Class used to build the seed data to the database.
  class DatabaseBuilder
    # @return It destroyes all the records from the user table
    def reset_data
      Course.destroy_all
    end

    # @return It creates 10 user with all the attributes required using the factorybot
    def create_users
      10.times do
        FactoryBot.create(:course)
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