class AddPaymentTitleToPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :packages, :payment_title, :string
  end
end
