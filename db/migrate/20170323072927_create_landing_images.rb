class CreateLandingImages < ActiveRecord::Migration[5.0]
  def change
    create_table :landing_images do |t|
      t.string :title
      t.text :subtitle
      t.string :background
      t.string :addon_image
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
