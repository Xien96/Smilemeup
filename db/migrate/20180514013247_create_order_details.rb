class CreateOrderDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :order_details do |t|
      t.references :user_product, index: true
      t.string :first_name
      t.string :last_name
      t.string :zip_code
      t.string :city
      t.string :country
      t.string :additional_information
      t.string :phone_number
      t.timestamps
    end
  end
end
