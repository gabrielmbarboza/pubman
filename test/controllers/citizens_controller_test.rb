require "test_helper"
require "faker"

class CitizensControllerTest < ActionDispatch::IntegrationTest
  self.use_transactional_tests = true

  setup do
    @citizen = citizens(:valid_citizen)
  end

  test "should get index" do
    get citizens_url
    assert_response :success
  end

  test "should get new" do
    get new_citizen_url
    assert_response :success
  end

  test "should create citizen" do
    assert_difference("Citizen.count") do
      post citizens_url, params: {
        citizen: {
          cns: "980 2115 1715 0004",
          cpf: Faker::IdNumber.brazilian_citizen_number(formatted: true),
          date_of_birth: @citizen.date_of_birth,
          email: Faker::Internet.email,
          full_name: Faker::Name.name_with_middle,
          phone: @citizen.phone,
          status: @citizen.status,
          address_attributes: {
            zip_code: @citizen.address.zip_code,
            street: @citizen.address.street,
            address_number: @citizen.address.address_number ,
            complement: @citizen.address.complement,
            neighborhood: @citizen.address.neighborhood,
            city: @citizen.address.city,
            state: @citizen.address.state
          }
        }
      }
    end
  end

  test "should show citizen" do
    get citizen_url(@citizen)
    assert_response :success
  end

  test "should get edit" do
    get edit_citizen_url(@citizen)
    assert_response :success
  end

  test "should update citizen" do
    patch citizen_url(@citizen), params: {
      citizen: { phone: "+98 (87) 98765-4321", status: :disabled } }

      @citizen.reload

      assert @citizen.phone == "+98 (87) 98765-4321"
      assert @citizen.disabled?
  end
end
