class Instruction < ActiveRecord::Base
	belongs_to :instructionSet

  validates :name, presence: true
	validates :step, presence: true
end
