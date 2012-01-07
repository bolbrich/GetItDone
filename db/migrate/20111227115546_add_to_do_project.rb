class AddToDoProject < ActiveRecord::Migration
  def change
    add_column :to_dos, :project_id, :integer
	add_index :to_dos, [:project_id, :id]
  end
end
