require 'test_helper'

class BrowsingAndSearchingTest < ActionDispatch::IntegrationTest
  fixtures :suppliers, :producers, :liquors, :liquors_suppliers

  test "browse" do
    jill = new_session_as :jill
    jill.index
    jill.second_page
    jill.liquor_details 'Pride and Prejudice'
    jill.latest_liquors
  end

  module BrowsingTestDSL
    include ERB::Util
    attr_writer :name

    def index
      get '/catalog/index'
      assert_response :success
      assert_select 'dl#liquors' do
        assert_select 'dt', :count => 5
      end
      assert_select 'dt' do
        assert_select 'a', 'The Idiot'
      end
      check_liquor_links
    end

    def second_page
      get '/catalog/index?page=2'
      assert_response :success
      assert_template 'catalog/index'
      assert_equal Liquor.find_by_name('Pro Rails E-Commerce'),
                   assigns(:liquors).last
      check_liquor_links
    end

    def liquor_details(title)
      @liquor = Liquor.where(:name => title).first
      get "/catalog/show/#{@liquor.id}"
      assert_response :success
      assert_template 'catalog/show'
      assert_select 'div#content' do
        assert_select 'h1', @liquor.name
        assert_select 'h2', "por #{@liquor.suppliers.map{|a| a.name}.join(", ")}"
      end
    end

    def latest_liquors
      get '/catalog/latest'
      assert_response :success
      assert_template 'catalog/latest'
      assert_select 'dl#liquors' do
        assert_select 'dt', :count => 5
      end
      @liquors = Liquor.latest(5)
      @liquors.each do |a|
        assert_select 'dt' do
          assert_select 'a', a.name
        end
      end
    end

    def check_liquor_links
      for liquor in assigns :liquors
        assert_select 'a' do
          assert_select '[href=?]', "/catalog/show/#{liquor.id}"
        end
      end
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(BrowsingTestDSL)
      session.name = name
      yield session if block_given?
    end
  end

  def views_latest_liquors
    get "/catalog/latest"
    assert_response :success
    assert_template "catalog/latest"

    assert_select "dl#liquors" do 
      assert_select "dt" { :count => 5 }
    end

    Liquor.latest.each do |liquor|
      assert_select "dt", text => liquor.name
    end
    check_liquors_links
    end
end
