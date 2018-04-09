require 'test_helper'

class Admin::ProducerControllerTest < ActionController::TestCase
  fixtures :producers

  test "new" do
    get :new
    assert_response :success
  end

  test "create" do
    num_producers = Producer.count
    post :create, :producer => { :name => 'El monopolio del alcohol' }
    assert_response :redirect
    assert_redirected_to :action => 'index'
    assert_equal num_producers + 1, Producer.count
  end

  test "edit" do
    get :edit, :id => 1
    assert_select 'input' do
      assert_select '[type=?]', 'text'
      assert_select '[name=?]', 'producer[name]'
      assert_select '[value=?]', 'Apress'
    end
    # assert_tag :tag => 'input', :attributes => { :name => 'producer[name]', :value => 'Apress' }
  end

  test "update" do
    post :update, :id => 1, :producer => { :name => 'Apress.com' }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'Apress.com', Producer.find(1).name
  end

  test "destroy" do
    assert_difference(Producer, :count, -1) do
      post :destroy, :id => 1
      assert_equal flash[:notice], 'Productor borrado satisfactoriamente Apress.com'
      assert_response :redirect
      assert_redirected_to :action => 'index'
      get :index
      assert_response :success
      assert_select 'div#notice', 'Productor borrado satisfactoriamente Apress.com'
      # assert_tag :tag => 'div', :attributes => {:id => 'notice'},
      #            :content => 'Succesfully deleted publisher Apress.'
    end
  end

  test "show" do
    get :show, :id => 1
    assert_response :success
    assert_template 'admin/producer/show'
    assert_not_nil assigns(:producer)
    assert assigns(:producer).valid?
    assert_select 'div#content' do
      assert_select 'h1', Producer.find(1).name
    end
    # assert_tag "h1", :content => Producer.find(1).name
  end

  test "index" do
    get :index
    assert_response :success
    assert_select 'table' do
      assert_select 'tr', Producer.count + 1
    end
    # assert_tag :tag => 'table', :children => { :count => Producer.count + 1, :only => {:tag => 'tr'} }
    Producer.find_each do |a|
      assert_select 'td', a.name
      # assert_tag :tag => 'td', :content => a.name
    end
  end

end
