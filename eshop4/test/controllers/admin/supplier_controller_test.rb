require 'test_helper'

class Admin::SupplierControllerTest < ActionController::TestCase
  fixtures :suppliers

  test "new" do
    get :new
    assert_template 'admin/supplier/new'
    assert_select 'div#content' do
      assert_select 'h1', 'Crear nuevo proveedor'
      assert_select "form[action=\"/admin/supplier/create\"]"
    end

  end

  test "create" do
    get :new    
    assert_template 'admin/supplier/new'
    assert_difference(Supplier, :count) do
      post :create, :supplier => {:first_name => 'Joel', :last_name => 'Spolsky'}
      assert_response :redirect
      assert_redirected_to :action => 'index'      
    end
    assert_equal 'Proveedor Joel Spolsky fue creado correctamente.', flash[:notice]
  end

  test "failing_create" do
    assert_no_difference(Supplier, :count) do
      post :create, :supplier => {:first_name => 'Joel'}
      assert_response :success
      assert_template 'admin/supplier/new'
      assert_select "div[class=\"field_with_errors\"]"
    end
  end

  test "edit" do
    get :edit, :id => 1
    assert_select 'input' do
      assert_select '[type=?]', 'text'
      assert_select '[name=?]', 'supplier[first_name]'
      assert_select '[value=?]', 'Joel'
    end
    assert_select 'input' do
      assert_select '[type=?]', 'text'
      assert_select '[name=?]', 'supplier[last_name]'
      assert_select '[value=?]', 'Spolsky'
    end
  end

  test "update" do
    post :update, :id => 1, :supplier => { :first_name => 'Joseph', :last_name => 'Smith' }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'Joseph', Supplier.find(1).first_name
    assert_equal 'Smith', Supplier.find(1).last_name
  end

  test "test_destroy" do
    assert_difference(Supplier, :count, -1) do
      post :destroy, :id => 1
      assert_equal flash[:notice], 'Se ha borrado correctamente el proveedor Joel Spolsky.'
      assert_response :redirect
      assert_redirected_to :action => 'index'
      get :index
      assert_response :success
      assert_select 'div#notice', 'Se ha borrado correctamente el proveedor Joel Spolsky.'
    end
  end

  test "show" do
    get :show, :id => 1
    assert_template 'admin/supplier/show'
    assert_equal 'Joel', assigns(:supplier).first_name
    assert_equal 'Spolsky', assigns(:supplier).last_name
    assert_select 'div#content' do
      assert_select 'h1', Supplier.find(1).name
    end
  end

  test "index" do
    get :index
    assert_response :success
    assert_select 'table' do
      assert_select 'tr', Supplier.count + 1
    end
    Supplier.find_each do |a|
      assert_select 'td', a.name
    end
  end

end
