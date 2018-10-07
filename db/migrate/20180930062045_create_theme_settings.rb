class CreateThemeSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :theme_settings do |t|
      t.string :title
      t.string :body_class
      t.text :css_tag
      t.text :header
      t.text :menu
      t.text :dropdown_menu
      t.text :footer
      t.text :js_tag

      t.timestamps
    end
  end
end
