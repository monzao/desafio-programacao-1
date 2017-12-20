class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.references :item, foreign_key: true
      t.references :purchaser, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
