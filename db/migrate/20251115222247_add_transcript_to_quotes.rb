class AddTranscriptToQuotes < ActiveRecord::Migration[8.0]
  def change
    add_column :quotes, :transcript, :text
  end
end
