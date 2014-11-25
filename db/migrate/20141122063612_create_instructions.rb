class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
			t.text :precondition
			t.text :description 
			t.integer :step, index: true
			t.integer :instruction_set_id, index: true
			t.string :name
			

      t.timestamps
    end
  end
end
