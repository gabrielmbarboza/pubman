require "test_helper"

class BirthDateTest < ActiveSupport::TestCase
  test "should be a valid birth date" do
    assert ::Validators::BirthDate.valid?(Date.current - 40.years)
  end

  test "should not be a valid, birth date is nil" do
    assert_not ::Validators::BirthDate.valid?(nil)
  end

  test "should not be a valid, birth date is not a Date class" do
    assert_not ::Validators::BirthDate.valid?("1984-05-31")
  end

  test "should not be a valid, birth date is greater than current date" do
    birth_date = Date.current + 5.days

    assert_not ::Validators::BirthDate.valid?(birth_date)
  end

  test "should not be a valid birth date, birth date is greater than 120 years" do
    assert_not ::Validators::BirthDate.valid?(Date.current - 130.years)
  end

  test "should not be a valid birth date, birth date is less than a week" do
    assert_not ::Validators::BirthDate.valid?(Date.current - 5.days)
  end
end
