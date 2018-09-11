class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :icon
      t.string :description
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
