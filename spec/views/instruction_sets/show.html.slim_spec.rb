require 'rails_helper'

RSpec.describe "instruction_sets/show", :type => :view do
  before(:each) do
    @instruction_set = FactoryGirl.create(:instruction_set)
  end

  it "renders attributes in <p>" do
    render
  end
end
