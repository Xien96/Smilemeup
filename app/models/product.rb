class Product < ApplicationRecord
	has_many  :user_products, dependent: :destroy
	has_many :styles, through: :user_products
	has_many :users, through: :user_products
end
