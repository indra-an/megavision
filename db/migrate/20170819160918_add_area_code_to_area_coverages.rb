class AddAreaCodeToAreaCoverages < ActiveRecord::Migration[5.0]
  def change
    add_reference :area_coverages, :area_code, foreign_key: true
  end
end
