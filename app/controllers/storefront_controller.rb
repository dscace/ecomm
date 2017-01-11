class StorefrontController < ApplicationController
	before_action :authenticate_user!

  def all_items
  	@products = Product.all
  end

  def items_by_category
  	@products = Product.where(category: params[:cat_id])
  	@category = Category.find(params[:cat_id])
  end

  def items_by_brand
    @products = Product.where(brand: params[:brand])
    @brand = params[:brand]
  end
end

