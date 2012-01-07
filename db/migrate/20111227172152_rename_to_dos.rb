class RenameToDos < ActiveRecord::Migration
  def change
	rename_column :to_dos, :Title, :title
	rename_column :to_dos, :Kurzbeschreibung, :short_description
	rename_column :to_dos, :Details, :details
	rename_column :to_dos, :Deadline, :deadline
	rename_column :to_dos, :Zeiterfassung, :time
  end
end
