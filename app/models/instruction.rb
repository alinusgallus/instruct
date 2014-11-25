class Instruction < ActiveRecord::Base
	belongs_to :instruction_set
  validates :name, presence: true
	validates :step, presence: true, uniqueness: true
end
