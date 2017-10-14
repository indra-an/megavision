class CreateAreaCodesChannelTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :area_codes_channel_types do |t|
      t.references :area_code, foreign_key: true
      t.references :channel_type, foreign_key: true
    end
  end
end
