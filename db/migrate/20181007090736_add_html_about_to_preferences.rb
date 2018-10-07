class AddHtmlAboutToPreferences < ActiveRecord::Migration[5.0]
  def change
    add_column :preferences, :about_megavision_html, :text
    add_column :preferences, :about_product_html, :text
  end
end
