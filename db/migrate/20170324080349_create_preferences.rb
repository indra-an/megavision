class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :preferences do |t|
      t.text :about_megavision
      t.text :about_starnet
      t.text :company_history
      t.text :company_vision_missions
      t.text :addresses
      t.string :copyright_text
      t.string :linked_in_url
      t.string :facebook_url
      t.string :twitter_url
    end
  end
end
