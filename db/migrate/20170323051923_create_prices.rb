class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.decimal :amount
      t.integer :up_to_speed
      t.string :unit

      t.timestamps
    end
  end
end
