require "test_helper"

class CitizenTest < ActiveSupport::TestCase
  def setup
    Searchkick.enable_callbacks
  end

  def teardown
    Searchkick.disable_callbacks
  end

  def test_search
    citizen = citizens(:valid_citizen)
    citizen.save!

    Citizen.search_index.refresh
    assert_equal ["Citizen Valid"], Citizen.search("citizen valid").map(&:full_name)
  end

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
