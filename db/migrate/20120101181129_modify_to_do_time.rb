class ModifyToDoTime < ActiveRecord::Migration
  def change
	change_column :to_dos, :time, :float, :default => 0.0
  end
end
