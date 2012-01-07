class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :Title
      t.text :Kurzbeschreibung
      t.text :Details
      t.datetime :Deadline
      t.float :Zeiterfassung
			
      t.timestamps
    end
  end
end
