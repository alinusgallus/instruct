require 'rails_helper'

RSpec.describe "instruction_sets/new", :type => :view do
  before(:each) do
    assign(:instruction_set, InstructionSet.new())
  end

  it "renders new instruction_set form" do
    render

    assert_select "form[action=?][method=?]", instruction_sets_path, "post" do
    end
  end
end
