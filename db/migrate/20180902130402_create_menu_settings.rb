class CreateMenuSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_settings do |t|
      t.string :menu
      t.string :slug
      t.string :type
      t.boolean :is_active, default: true
      t.boolean :hidden_content, default: false
      t.boolean :disable_content, default: false
      t.integer :parent_id, default: nil
      t.integer :position
      t.integer :link_type, default: 0
      t.timestamps
    end
  end
end
