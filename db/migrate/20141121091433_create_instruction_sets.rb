class CreateInstructionSets < ActiveRecord::Migration
  def change
    create_table :instruction_sets do |t|

      t.timestamps
    end
  end
end
