require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get cities" do
    get addresses_cities_url format: :turbo_stream, params: { target: :select, state: :es }
    assert_response :success
  end
end
