class AddFieldToMenuSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :menu_settings, :html_content, :text
    add_column :menu_settings, :js, :text
    add_column :menu_settings, :html_additional, :json
  end
end
