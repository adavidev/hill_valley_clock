class ClockTime < ActiveRecord::Base
  attr_accessible :clockin, :employee_id, :created_at

  belongs_to :employee

  before_create :set_clockin_status

  def last_clock(employee_id)
    self.class.find_all_by_employee_id(employee_id).last
  end

  def set_clockin_status
    last = last_clock(employee_id)
    self.clockin = last ? !last.clockin : true
    true
  end
end
