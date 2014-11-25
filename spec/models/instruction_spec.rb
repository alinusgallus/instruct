require 'rails_helper'


describe Instruction do
  it do
  	should belong_to(:instruction_set)
  	should validate_uniqueness_of(:step)
  	should validate_presence_of(:step)
  	should validate_presence_of(:name)
  end
end
