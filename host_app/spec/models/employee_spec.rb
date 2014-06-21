require 'spec_helper'

describe Employee do
  it { should have_many :clock_times }
  it { should validate_uniqueness_of :pin }

  describe :valid_types do
    it "should give a list of valid types" do
      subject.valid_types.should == ["employee", "administrator"]
    end
  end

  describe :type_in_valid_types do
    it "should add an error if type is not a valid type" do
      subject.employee_type = "foo"
      subject.save
      subject.errors[:employee_type].include?("type is invalid.").should == true
    end
  end

  describe :set_defaults do
    it "should set a type default if none is set" do
      subject.save
      subject.employee_type.should == subject.valid_types.first
    end

    it "should not replace an existing type" do
      subject.employee_type = "administrator"
      subject.save
      subject.employee_type.should == "administrator"
    end
  end

  describe :clocked_in? do
    before :each do
      @employee = Employee.new
      @employee.pin = "1234"
      @employee.save
      ClockTime.create(employee_id: @employee.id)
    end

    it "should return true if an employee clocks in" do
      @employee.clocked_in?.should == true
    end

    it "should return false if an employee is clocked out" do
      ClockTime.create(employee_id: @employee.id)
      @employee.clocked_in?.should == false
    end
  end

  describe :last_clocked do
    before :each do
      @employee = Employee.new
      @employee.pin = "1234"
      @employee.save
      ClockTime.create(employee_id: @employee.id)
    end

    it "should show the employees last time logged" do
      @employee.last_clocked.should == ClockTime.last_clock(@employee.id).created_at
    end
  end

  describe :last_weeks_clocks do
    before :each do
      @employee = Employee.new
      @employee.pin = "1234"
      @employee.save
      ClockTime.create(employee_id: @employee.id)
      @ct = ClockTime.create!(employee_id: @employee.id, created_at: DateTime.now - 7)
      @ct2 = ClockTime.create!(employee_id: @employee.id)
      @ct3 = ClockTime.create!(employee_id: @employee.id, created_at: DateTime.now - 8)

      @employee1 = Employee.new
      @employee1.pin = "123456"
      @employee1.save
      ClockTime.create(employee_id: @employee1.id)
      @ct = ClockTime.create!(employee_id: @employee1.id, created_at: DateTime.now - 7)
      @ct2 = ClockTime.create!(employee_id: @employee1.id)
      @ct3 = ClockTime.create!(employee_id: @employee1.id, created_at: DateTime.now - 8)
    end

    it "should return all of last 7 days' clocks for this employee" do
      @employee.last_weeks_clocks.size.should == 3
    end

    context :administrator do
      before :each do
        @admin = Employee.new
        @admin.pin = "12345"
        @admin.employee_type = "administrator"
        @admin.save
      end
      it "should return all employees' clocks for the past 7 days" do
        @admin.last_weeks_clocks.size.should == 6
      end
    end
  end
end
