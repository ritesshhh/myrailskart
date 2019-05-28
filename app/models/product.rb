class Product < ApplicationRecord
	validates :name, presence: true		
	validates :sku_id, presence: true
	validates :price, presence: true
	validates :expire_date, presence: true
	validates :images, presence: true

end
