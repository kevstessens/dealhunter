class CreateClientsOffers < ActiveRecord::Migration
  def change
    create_table :clients_offers do |t|
      t.integer :offer_id
      t.integer :client_id
      t.integer :position
      t.boolean :participated

      t.timestamps
    end
  end
end
