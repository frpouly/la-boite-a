class CreatePeople < ActiveRecord::Migration[7.2]
  def change
    create_table :people do |t|
      t.string :name

      t.timestamps
    end

    add_reference :quotes, :person, null: false, foreign_key: true
  end
end
