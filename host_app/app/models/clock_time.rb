class ClockTime < ActiveRecord::Base
  attr_accessible :clockin, :employee_id, :created_at

  belongs_to :employee

  before_create :set_clockin_status

  scope :for_date_range, ->(start_date, end_date) do
    where("created_at >= ? AND created_at <= ?", start_date, end_date)
  end

  scope :for_employee, ->(employee_id) do
    where("employee_id = ?", employee_id)
  end

  def self.last_clock(employee_id)
    find_all_by_employee_id(employee_id).last
  end

  def set_clockin_status
    last = self.class.last_clock(employee_id)
    self.clockin = last ? !last.clockin : true
    true # because if clockin resolves to false, it wont create
  end
end
