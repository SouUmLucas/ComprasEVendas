class ProductsController < ApplicationController

  # Index action(i.g. 'my')
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: t('flash.notice.product_created')
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product, notice: 'Produto atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])  # Verificar necessidade
    @product.destroy
    redirect_to products_url
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:description, :price, :product_type)
    end
end