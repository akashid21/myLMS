class Teachers::TeachersController < ApplicationController
  before_action :authenticate_teacher!
end