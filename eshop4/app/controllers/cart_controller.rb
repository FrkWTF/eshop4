class CartController < ApplicationController
  before_filter :initialize_cart

  def add
    @liquor = Liquor.find params[:id]
    @page_title = 'Añadir ítem'
    if request.xhr?
      @item = @cart.add params[:id]
      flash.now[:cart_notice] = "Licor <em>#{@item.liquor.name}</em> añadido satisfactoriamente al carrito."
      render :controller => 'cart', :action => 'add_with_ajax'
    elsif request.post?
      @item = @cart.add params[:id]
      flash[:cart_notice] = "Añadido <em>#{@item.liquor.name}</em>."
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'add', :template => 'cart/add'
    end
  end

  def remove
    @liquor = Liquor.find params[:id]
    @page_title = 'Eliminar ítem'
    if request.xhr?
      @item = @cart.remove params[:id]
      flash.now[:cart_notice] = "Licor <em>#{@item.liquor.name}</em> eliminado satisfactoriamente al carrito."
      render :controller => 'cart', :action => 'remove_with_ajax'
    elsif request.post?
      @item = @cart.remove params[:id]
      flash[:cart_notice] = "Eliminado 1 <em>#{@item.liquor.name}</em>."
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'remove'
    end
  end

  def clear
    @page_title = 'Limpiar carrito'
    if request.xhr?
      @cart.cart_items.destroy_all
      flash.now[:cart_notice] = "Carrito vaciado."
      render :controller => 'cart', :action => 'clear_with_ajax'
    elsif request.post?
      @cart.cart_items.destroy_all
      flash[:cart_notice] = "Carrito vaciado."
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'clear'
    end
  end
end
