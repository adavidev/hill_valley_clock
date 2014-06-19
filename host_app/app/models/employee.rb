class Employee < ActiveRecord::Base
  attr_accessible :employee_id

  has_many :clock_times
end
