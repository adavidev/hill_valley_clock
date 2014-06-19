class ClockTime < ActiveRecord::Base
  attr_accessible :in, :employee_id, :created_at

  belongs_to :employee
end
