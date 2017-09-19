class CreateAdminLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_logs do |t|
      t.references :admin, foreign_key: true
      t.string :type
      t.text :data

      t.timestamps
    end
  end
end
