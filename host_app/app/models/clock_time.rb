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

  scope :clock_ins, -> { where("clockin = true") }
  scope :clock_outs, -> { where("clockin = false") }

  def self.last_clock(employee_id)
    find_all_by_employee_id(employee_id).last
  end

  def set_clockin_status
    last = self.class.last_clock(employee_id)
    self.clockin = last ? !last.clockin : true
    true # because if clockin resolves to false, it wont create
  end

  def elapsed_time
    clocks = self.class.for_employee(employee_id)
    clockin ? 0 : (created_at - clocks[clocks.index(self) - 1].created_at)
  end

  def to_s
    "#{employee.first_name} #{employee.last_name}: #{I18n.t("clock_time.clockin.#{clockin}")} #{created_at}"
  end

end
