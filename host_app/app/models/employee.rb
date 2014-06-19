class Employee < ActiveRecord::Base
  attr_accessible :employee_id

  has_many :clock_times

  def update_time
    ClockTime.create({employee_id: id})
  end
end
