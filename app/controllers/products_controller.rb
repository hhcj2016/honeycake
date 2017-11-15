class ProductsController < ApplicationController

  def index
     if params[:category].blank?
        @products = Product.all
     else
        @category_id = Category.find_by(name: params[:category]).id
        @products = Product.where(:category_id => @category_id)
     end
  end

  def show
   @product = Product.find(params[:id])
  end

  def add_to_cart
   @product = Product.find(params[:id])
     if !current_cart.products.include?(@product)
       current_cart.add_product_to_cart(@product)
       flash[:notice] = "你已成功将#{@product.title}加入购物车"
     else
       flash[:warning] = "你的购物车已有此物品"
     end
     redirect_to :back
  end

    def favorite
      @product = Product.find(params[:id])
      unless @product.find_favorite(current_user)  # 如果已经收藏过了，就略过不再新增
        Favorite.create( :user => current_user, :product => @product)
      end

      redirect_to product_path
    end

    def unfavorite
      @product = Product.find(params[:id])
      favorite = @product.find_favorite(current_user)
      favorite.destroy

      redirect_to product_path
    end

end
