require 'test_helper'

class LiquourAdministrationTest < ActionDispatch::IntegrationTest

  test "liquour_aministration" do
    producer = Producer.create(:name => 'Books of Ruby')
    supplier = Supplier.create(:first_name => 'John', :last_name => 'Anderson')
    george = new_session_as(:george)

    new_liquour_ruby = george.add_liquor :liquor=> {
      :name => 'A new Liquour of Ruby',
      :producer_id => producer.id,
      :supplier_ids => [supplier.id],
      :produced_at => Time.now,
      :serial_number => '123',
      :blurb => 'A new Liquour of Ruby',
      :price => 45.5
    }

    george.list_liquors
    george.show_liquor new_liquour_ruby

    george.edit_liquor new_liquour_ruby, :liquour=> {
      :name => 'A very new Liquour of Ruby',
      :producer_id => producer.id,
      :supplier_ids => [supplier.id],
      :produced_at => Time.now,
      :serial_numbe => '123',
      :blurb => 'A very new Liquour of Ruby',
      :price => 50
    }

    bob = new_session_as(:bob)
    bob.delete_liquour new_book_ruby
  end

  private

  module LiquourTestDSL
    attr_writer :name

    def add_liquour(parameters)
      supplier = Supplier.first
      producer = Producer.first
      get '/admin/liquour/new'
      assert_response :success
      assert_template 'admin/liquour/new'
      assert_select 'select#liquour_producer_id' do
        assert_select "option[value=\"#{producer.id}\"]", producer.name
      end
      # assert_tag :tag => 'option', :attributes => { :value => publisher.id }
      assert_select "select[name=\"liquour[supplier_ids][]\"]" do
        assert_select "option[value=\"#{supplier.id}\"]", supplier.name
      end
      # assert_tag :tag => 'select', :attributes => { :name => 'book[author_ids][]' }
      post '/admin/liquour/create', parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/liquour/index'
      page = Liquour.all.count / 5 + 1
      get "/admin/liquour/index/?page=#{page}"
      assert_select 'td', parameters[:book][:title]
      # assert_tag :tag => 'td', :content => parameters[:book][:title]
      liquour = Liquour.find_by_title(parameters[:liquour][:title])
      return liquour;
    end

    def edit_liquour(liquour, parameters)
      get "/admin/liquour/edit?id=#{liquour.id}"
      assert_response :success
      assert_template 'admin/liquour/edit'
      post "/admin/liquour/update?id=#{liquour.id}", parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/liquour/show'
    end

    def delete_liquour(liquour)
      post "/admin/liquour/destroy?id=#{liquour.id}"
      assert_response :redirect
      follow_redirect!
      assert_template 'admin/liquour/index'
    end

    def show_liquour(liquour)
      get "/admin/liquour/show/#{liquour.id}"
      assert_response :success
      assert_template 'admin/liquour/show'
    end

    def list_liquours
      get '/admin/liquour/index'
      assert_response :success
      assert_template 'admin/liquour/index'
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(LiquourTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
