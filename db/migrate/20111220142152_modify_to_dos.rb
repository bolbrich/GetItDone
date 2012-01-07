class ModifyToDos < ActiveRecord::Migration
  def change
    add_column :to_dos, :priority, :string
  end
end
