class RenameUsers < ActiveRecord::Migration
  def change
	rename_column :users, :name, :first_name
	rename_column :users, :nachname, :last_name
	rename_column :users, :benutzername, :user_name
  end
end
