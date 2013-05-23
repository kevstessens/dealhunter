class CreateClientTitles < ActiveRecord::Migration
  def change
    create_table :client_titles do |t|
      t.integer :client_id
      t.integer :title_id

      t.timestamps
    end
  end
end
