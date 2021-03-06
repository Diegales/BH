# encoding: UTF-8
class CartController < ApplicationController
	before_filter :initialize_cart

	def add
    @glasses = Glasses.find params[:id]
    @page_title = 'Añadir producto'
    if request.post?
      @item = @cart.add params[:id]
      flash[:cart_notice] = "Added <em>#{@item.glasses.name}</em>.".html_safe
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'add', :template => 'cart/add'
    end
  end

  def remove
    @glasses = Glasses.find params[:id]
    @page_title = 'Eliminar producto'
    if request.post?
      @item = @cart.remove params[:id]
      flash[:cart_notice] = "Removed 1 <em>#{@item.glasses.name}</em>.".html_safe
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'remove', :template => 'cart/remove'
    end
  end

  def clear
    @page_title = 'Vaciar Carro'
    if request.post?
      @cart.cart_items.destroy_all
      flash[:cart_notice] = "Cleared cart."
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'clear', :template => 'cart/clear'
    end
  end
end
