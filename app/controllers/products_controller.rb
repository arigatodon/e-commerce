class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @categories = Category.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @review = @product.reviews.reverse
    
  end

  # GET /products/new
  def new
    @product = Product.new

  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def uplike
    @product = Product.find(params[:id])
    @like = @product.likes.build(user:@current_user)
    if @product.user_likes.include? current_user
      @product.likes.where(user:current_user).first.delete
      redirect_to @post, notice: "Tu like ha sido borrado"
    elsif @like.save
      redirect_to @product, notice: "le has dado like"
    else
      redirect_to @product, notice: "No puedes realizar like traidor"
    end
  end

  def set_categories
    if params.key?(:categories_ids) && !params[:categories_ids].empty? && params.key?(:products_ids) && !params[:products_ids].empty?
      @products = Product.find(params[:products_ids])
      @categories = Category.find(params[:categories_ids])
      @products.each do |product|
        product.categories = @categories
      end
      redirect_to root_path, notice: 'Categoria(s) asignado correctamente.'
    else
      redirect_to root_path, alert: 'Tienes que seleccionar al menos una categoria y un producto'
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :image, :image_cache, :remove_image)
    end
end
