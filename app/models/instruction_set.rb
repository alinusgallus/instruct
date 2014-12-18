class InstructionSet < ActiveRecord::Base
	has_many :instructions
	accepts_nested_attributes_for :instructions, allow_destroy: true, reject_if: :new_record?

	validates :name, length: { maximum: 40 }, presence: true
	validates :description, presence: true 


end
