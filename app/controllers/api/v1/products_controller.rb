module Api
	module V1
		class ProductsController < ApplicationController
			skip_before_action :verify_authenticity_token, :only => [:create, :edit, :update, :destroy]
			def index
				products = Product.order('created_at DESC')
				render json: {status: 'SUCCESS', message: 'Loaded Products', data: products}, status: :ok
			end

			def show
				product = Product.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Loaded Product', data: product}, status: :ok
			end

			def create
				product = Product.new(product_params)
				
				if product.save
					render json: {status: 'SUCCESS', message: 'Saved Product', data: product}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Product not saved', data: product.errors}, 
					status: :unprocessable_entity
				end

			end

			def update
				product = Product.find(params[:id])
				if product.update_attributes(product_params)
					render json: {status: 'SUCCESS', message: 'Updated Product', data: product}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Product not updated', data: product.errors}, 
					status: :unprocessable_entity
				end
			end

			def destroy
				product = Product.find(params[:id])
				product.destroy
				render json: {status: 'SUCCESS', message: 'Deleted Product', data: product}, status: :ok
			end

			private
			
			def product_params
				params.permit(:name, :expire_date, :sku_id, :images, :price)
			end
		end
	end
end
