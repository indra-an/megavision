class CreateCoverages < ActiveRecord::Migration[5.0]
  def change
    create_table :coverages do |t|
      t.string :name
      t.text :coordinates

      t.timestamps
    end
  end
end
