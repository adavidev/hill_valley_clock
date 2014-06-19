class Employee < ActiveRecord::Base
  attr_accessible :pin,  :employee_id

  has_many :clock_times
end
