require File.dirname(__FILE__) + '/../test_helper'

class ManufacturerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :manufacturers
   def test_name
      manufacturer= Manufacturer.new(:company_name => 'Arnette')
      assert_equal 'Arnette', manufacturer.name
   end
end
