class InstructionSet < ActiveRecord::Base
	has_many :instructions
	validates :name, length: { maximum: 40 }, presence: true
	validates :description, presence: true 




end
