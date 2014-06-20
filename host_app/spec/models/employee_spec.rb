require 'spec_helper'

describe Employee do
  it { should have_many :clock_times }
  it { should validate_uniqueness_of :pin }
end
