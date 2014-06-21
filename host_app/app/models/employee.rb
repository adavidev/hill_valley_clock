class Employee < ActiveRecord::Base
  attr_accessible :pin, :employee_id, :first_name, :last_name, :employee_type

  has_many :clock_times

  validates :pin, uniqueness: true
  validate :type_in_valid_types

  before_validation :set_defaults

  def set_defaults
    self.employee_type ||= valid_types.first
  end

  def type_in_valid_types
    if !valid_types.include?(self.employee_type)
      errors.add(:employee_type, "type is invalid.")
    end
  end

  def valid_types
    ["employee", "administrator"]
  end

  def clocked_in?
    ClockTime.last_clock(self.id).clockin
  end

  def last_clocked
    ClockTime.last_clock(id).created_at
  end

  def last_weeks_clocks
    clock_times = ClockTime.for_date_range(DateTime.now - 7, DateTime.now)

    employee_type == "employee" ? clock_times.for_employee(id) : clock_times
  end
end
