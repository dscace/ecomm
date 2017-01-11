class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
     devise_parameter_sanitizer.permit(:account_update, keys[:role])
  end
  
  before_filter :categories, :brands

  def categories
  	@categories = Category.all
  end

  def brands
   	@brands = Product.pluck(:brand).sort.uniq!
    	if @brands == nil
    		@brands = Product.pluck(:brand).sort
   		end
  end
  
end


  

 