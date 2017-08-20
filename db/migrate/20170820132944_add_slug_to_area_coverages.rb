class AddSlugToAreaCoverages < ActiveRecord::Migration[5.0]
  def change
    add_column :area_coverages, :slug, :string
  end
end
