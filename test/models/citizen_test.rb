require "test_helper"

class CitizenTest < ActiveSupport::TestCase
  test "should create a valid citizen " do
    citizen = citizens(:valid_citizen)

    assert citizen.valid?
  end

  test "should not create a citizen, email is not valid" do
    citizen = citizens(:citizen_with_invalid_email)
    assert_not citizen.valid?
  end

  test "should not create a citizen, cns is not valid" do
    citizen = citizens(:citizen_with_invalid_cns)
    assert_not citizen.valid?
  end

  test "should not create a citizen, cpf is not valid" do
    citizen = citizens(:citizen_with_invalid_cpf)
    assert_not citizen.valid?
  end

  test "should not create a citizen, date of birth is not valid" do
    citizen = citizens(:citizen_with_invalid_date_of_birth)
    assert_not citizen.valid?
  end
end
