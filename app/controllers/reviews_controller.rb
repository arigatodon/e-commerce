class ReviewsController < ApplicationController


  def create
    @product = Product.find(params[:product_id])
  	@reviews = @product.reviews
    @reviews = @product.reviews.build(review_params)
  	@reviews.save

  	redirect_to @product
  end

   def uplike
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:review_id])

    @like = @review.likes.build(user:@current_user)
     if @review.user_likes.include? current_user
      @review.likes.where(user:current_user).first.delete
      redirect_to @post, notice: "Tu like ha sido borrado"
    elsif @like.save
      redirect_to @product, notice: "le has dado like"
    else
      redirect_to @product, notice: "No puedes realizar like traidor"
     end
   end
  # DEL
  private

		def review_params
			params.require(:review).permit(:content)
		end
end
