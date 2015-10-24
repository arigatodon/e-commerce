class ReviewsController < ApplicationController
  def create
  	@product = Product.find(params[:product_id])
  	@reviews = @product.reviews


  	@reviews = @product.reviews.build(review_params)
  	@reviews.save

  	redirect_to @product
  end
  private

		def review_params
			params.require(:review).permit(:content)
		end
end
