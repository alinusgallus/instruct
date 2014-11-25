class AddNameAndDesciptionColumns < ActiveRecord::Migration
  

  def change
  	change_table :instruction_sets do |t|
  		t.string :name, limit: 40, null: false
  		t.text :description, limit: 300
  	end
  end
end
