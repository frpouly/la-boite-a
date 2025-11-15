class AddNicknameToPeople < ActiveRecord::Migration[8.0]
  def up
    add_column :people, :nickname, :string

    Person.reset_column_information
    Person.find_each do |p|
      p.update_columns(nickname: p.name)
    end

    change_column_null :people, :nickname, false
    add_index :people, :nickname, unique: true
  end

  def down
    remove_column :people, :nickname, :string
  end
end
