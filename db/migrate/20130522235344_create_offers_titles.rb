class CreateOffersTitles < ActiveRecord::Migration
  def change
    create_table :offers_titles do |t|
      t.integer :offer_id
      t.integer :title_id

      t.timestamps
    end
  end
end
