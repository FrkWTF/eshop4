require 'test_helper'

class CartControllerTest < ActionController::TestCase
  fixtures :suppliers, :producers, :liquors

  test "add" do
    assert_difference(CartItem, :count) do
      post :add, :id => 4
    end
    assert_response :redirect
    assert_redirected_to :controller => 'catalog'
    assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
  end

  test "remove" do
    post :add, :id => 4
    assert_equal [Liquor.find(4)], Cart.find(@request.session[:cart_id]).liquors

    post :remove, :id => 4
    assert_equal [], Cart.find(@request.session[:cart_id]).liquors
  end

  test "clear" do
    post :add, :id => 4
    assert_equal [Liquor.find(4)], Cart.find(@request.session[:cart_id]).liquors

    post :clear
    assert_response :redirect
    assert_redirected_to :controller => 'catalog'
    assert_equal [], Cart.find(@request.session[:cart_id]).liquors
  end
end
