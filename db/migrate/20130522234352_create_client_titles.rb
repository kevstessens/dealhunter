class CreateClientTitles < ActiveRecord::Migration
  def change
    create_table :client_titles do |t|
      t.references :client
      t.references :title

      t.timestamps
    end
    add_index :client_titles, :title_id
    add_index :client_titles, :client_id

  end

end
