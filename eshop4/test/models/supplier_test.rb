require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  test "test_name" do
    supplier = Supplier.create(:first_name => 'Joel', :last_name => 'Spolsky')
    assert_equal 'Joel Spolsky', supplier.name
  end
end
