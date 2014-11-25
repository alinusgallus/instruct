require 'rails_helper'

RSpec.describe "instruction_sets/edit", :type => :view do
  before(:each) do
    @instruction_set = FactoryGirl.create(:instruction_set)
  end

  it "renders the edit instruction_set form" do
    render

    assert_select "form[action=?][method=?]", instruction_set_path(@instruction_set), "post" do
    end
  end
end
