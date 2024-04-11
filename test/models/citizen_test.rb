require "test_helper"

class CitizenTest < ActiveSupport::TestCase
  self.use_transactional_tests = true

  def setup
    Searchkick.enable_callbacks
    @citizen = citizens(:valid_citizen)
  end

  def teardown
    Searchkick.disable_callbacks
  end

  def test_search
    Citizen.search_index.refresh
    assert_equal ["Citizen Valid"], Citizen.search("citizen valid").map(&:full_name)
  end

  test "should create a valid citizen " do
    assert @citizen.persisted?
  end

  test "should not save a citizen, citizen is valid but address is not valid" do
    @citizen.address.zip_code = nil
    assert_not @citizen.address.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @citizen.save! }
  end

  test "should not save a citizen, email is not valid" do
    @citizen.email = nil
    assert_not @citizen.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @citizen.save! }

    @citizen.email = 'email_example.com'
    assert_not @citizen.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @citizen.save! }
  end

  test "should not save a citizen, cns is not valid" do
    @citizen.cns = nil
    assert_not @citizen.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @citizen.save! }

    @citizen.cns = '321 4321 5432 6543'
    assert_not @citizen.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @citizen.save! }
  end

  test "should not create a citizen, cpf is not valid" do
    @citizen.cpf = nil
    assert_not @citizen.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @citizen.save! }

    @citizen.cpf = '123.456.678-90'
    assert_not @citizen.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @citizen.save! }
  end

  test "should not create a citizen, date of birth is not valid" do
    @citizen.date_of_birth = nil
    assert_not @citizen.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @citizen.save! }

    @citizen.date_of_birth = 150.years.ago
    assert_not @citizen.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @citizen.save! }

    @citizen.date_of_birth = Date.current + 1.month
    assert_not @citizen.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @citizen.save! }

    @citizen.date_of_birth = "2324-25-26"
    assert_not @citizen.valid?
    assert_raises(ActiveRecord::RecordInvalid) { @citizen.save! }
  end
end
