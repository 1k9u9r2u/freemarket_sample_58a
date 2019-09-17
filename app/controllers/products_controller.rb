class ProductsController < ApplicationController

  before_action :authenticate_user!,      only: [:new,:create,:destroy,:edit,:update]
  before_action :set_products_instance
  before_action :set_products,            only:[:destroy,:update]

  def index
    @products = Product.includes(:images).where(status: 0).order("created_at DESC").limit(10)    #複数の指定なので返り値は配列
    
  end


  def new
    @product = Product.new
    @item_image = @product.images.build
  end



  def create
    # binding.pry
    @product = Product.new(product_params)
    if @product.save
      params[:product][:image][:image].each do |a|
        @item_image = @product.images.create!(image: a)
      redirect_to controller: :products, action: :index
    end
  end
end


  def destroy
    product.destroy if product.user_id == current_user.id
  end



  def edit

  end



  def show
    
  end



  def update
    @product.update(product_params) if @product.user_id == current_user.id
    if @product.save
      redirect_to controller: :products, action: :show
      flash[:success] = "編集しました"
    else 
      redirect_to controller: :products, action: :edit
    end
  end



private

  def product_params
    params.require(:product).permit(:name, :detail, :category, :price, :status, :state, :city, :delivery, :delivery_time, :fee_payer, images_attributes: [:image]).merge(user_id: current_user.id)
  end
  
  def set_products_instance
    @product = Product.find(42)
  end

  def set_products
    product = Product.find(params[:id])
  end


end
