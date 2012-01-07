class DoneToDos < ActiveRecord::Migration
  def change
    add_column :to_dos, :done, :boolean, :default => 0
  end
end
