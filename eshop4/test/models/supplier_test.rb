require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  test "test_name" do
    supplier = Supplier.create(:first_name => 'Joseph', :last_name => 'Smith')
    assert_equal 'Joseph Smith', supplier.name
  end
end
