class ProductsController < ApplicationController

	before_action :set_product, only: [:show, :edit, :update]
	skip_before_action :verify_authenticity_token, :only => [:show, :edit, :update]
	
	def index
		@products = Product.all.order('created_at DESC')
	end

	def show
		
	end

	def edit
		
	end

	def update
		if @product.update(product_params)
			redirect_to @product, notice: 'Product was successfully updated.'
		else
			render :edit, alert: 'Your post was not updated'
		end	 
	end
	
	private 

	def set_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :sku_id, :price, :expire_date)
	end

end
