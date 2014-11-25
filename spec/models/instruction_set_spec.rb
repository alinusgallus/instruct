require 'rails_helper'

describe InstructionSet do
	
  it do 
  	should validate_presence_of(:name)
  	should validate_presence_of(:description)
  	should ensure_length_of(:name).is_at_most(40)
  end
end

