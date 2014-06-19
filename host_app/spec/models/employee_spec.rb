require 'spec_helper'

describe Employee do
  it { should have_many :clock_times }
end
