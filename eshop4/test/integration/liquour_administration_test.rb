require 'test_helper'

class LiquorsAdministrationTest < ActionDispatch::IntegrationTest

  test "liquor_aministration" do
    producer = Producer.create(:name => 'Books of Ruby')
    supplier = Supplier.create(:first_name => 'John', :last_name => 'Anderson')
    george = new_session_as(:george)

    new_liquor_ruby = george.add_liquor :liquor=> {
      :name => 'A new Liquour of Ruby',
      :producer_id => producer.id,
      :supplier_ids => [supplier.id],
      :produced_at => Time.now,
      :serial_number => '123',
      :blurb => 'A new Liquor of Ruby',
      :price => 45.5
    }

    george.list_liquors
    george.show_liquor new_liquor_ruby

    george.edit_liquor new_liquor_ruby, :liquor=> {
      :name => 'A very new Liquour of Ruby',
      :producer_id => producer.id,
      :supplier_ids => [supplier.id],
      :produced_at => Time.now,
      :serial_numbe => '123',
      :blurb => 'A very new Liquor of Ruby',
      :price => 50
    }

    bob = new_session_as(:bob)
    bob.delete_liquor new_liquor_ruby
  end

  private

  module LiquorTestDSL
    attr_writer :name

    def add_liquor(parameters)
      supplier = Supplier.first
      producer = Producer.first
      get '/admin/liquor/new'
      assert_response :success
      assert_template 'admin/liquor/new'
      assert_select 'select#liquor_producer_id' do
        assert_select "option[value=\"#{producer.id}\"]", producer.name
      end
      assert_select "select[name=\"liquor[supplier_ids][]\"]" do
        assert_select "option[value=\"#{supplier.id}\"]", supplier.name
      end
      post '/admin/liquor/create', parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/liquor/index'
      page = Liquor.all.count / 5 + 1
      get "/admin/liquor/index/?page=#{page}"
      assert_select 'td', parameters[:liquor][:name]
      liquor = Liquor.find_by_name(parameters[:liquor][:name])
      return liquor;
    end

    def edit_liquor(liquor, parameters)
      get "/admin/liquor/edit?id=#{liquor.id}"
      assert_response :success
      assert_template 'admin/liquor/edit'
      post "/admin/liquor/update?id=#{liquor.id}", parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/liquor/show'
    end

    def delete_liquor(liquor)
      post "/admin/liquor/destroy?id=#{liquor.id}"
      assert_response :redirect
      follow_redirect!
      assert_template 'admin/liquor/index'
    end

    def show_liquor(liquor)
      get "/admin/liquor/show/#{liquor.id}"
      assert_response :success
      assert_template 'admin/liquor/show'
    end

    def list_liquors
      get '/admin/liquor/index'
      assert_response :success
      assert_template 'admin/liquor/index'
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(LiquorTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
