require 'rails_helper'

RSpec.describe Admin, type: :model do
  let (:admin) { FactoryBot.build(:admin) }

  context 'When data is in right format' do
    scenario 'returns success' do
      debugger
      expect(user.valid?).to eq(true)
    end
  end

  context 'When validating the first name' do
    scenario 'should not be empty' do
      user.first_name = nil
      expect(user.valid?).to eq(false)
    end

    scenario 'lenght should not be less than 2' do
      user.first_name = 'a'
      expect(user.valid?).to eq(false)
    end

    scenario 'lenght should not be an integer' do
      user.first_name = 5
      expect(user.valid?).to eq(false)
    end
  end

  context 'When validating the last name' do
    scenario 'should not be empty' do
      user.last_name = nil
      expect(user.valid?).to eq(false)
    end

    scenario 'lenght should not be less than 2' do
      user.last_name = 'a'
      expect(user.valid?).to eq(false)
    end

    scenario 'lenght should not be an integer' do
      user.last_name = 5
      expect(user.valid?).to eq(false)
    end
  end

  context 'When validating the age' do
    scenario 'should not be less than 1' do
      user.age = 0
      expect(user.valid?).to eq(false)
    end

    scenario 'should not be more than 80' do
      user.age = 81
      expect(user.valid?).to eq(false)
    end
  end

  context 'When validating the email' do
    scenario 'should not be empty' do
      user.email = nil
      expect(user.valid?).to eq(false)
    end

    let (:created_user) { FactoryBot.create(:user) }
    scenario 'should be unique' do
      user.email = created_user.email # email that is already created
      expect(user.valid?).to eq(false)
    end

    scenario 'should be in proper format' do
      user.email = 'abhijeet@'
      expect(user.valid?).to eq(false)
    end
  end

  context 'When validating the date of birth' do
    scenario 'should not be empty' do
      user.date_of_birth = nil
      expect(user.valid?).to eq(false)
    end

    scenario 'should not be future date' do
      user.date_of_birth = Date.current.tomorrow
      expect(user.valid?).to eq(false)
    end
  end

  context 'When validating the password' do
    scenario 'should not be empty' do
      user.password = nil
      expect(user.valid?).to eq(false)
    end

    scenario 'password confirmation should match password' do
      user.password_confirmation = user.password
      expect(user.valid?).to eq(true)
    end
  end
end