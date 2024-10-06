class AddIndexOnNameToPeople < ActiveRecord::Migration[7.2]
  def change
    add_index :people, :name, unique: true
  end
end
