require 'rails_helper'

RSpec.describe "instruction_sets/index", :type => :view do
  before(:each) do
    assign(:instruction_sets,FactoryGirl.create_list(:instruction_set,4))
  end

  it "renders a list of instruction_sets" do
    render
  end
end
