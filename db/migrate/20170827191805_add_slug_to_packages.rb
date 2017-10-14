class AddSlugToPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :packages, :slug, :string
  end
end
