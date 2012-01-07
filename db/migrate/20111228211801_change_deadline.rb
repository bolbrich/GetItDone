class ChangeDeadline < ActiveRecord::Migration
  def change
	change_column :to_dos, :deadline, :date
  end
end
