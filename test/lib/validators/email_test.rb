require "test_helper"

class EmailTest < ActiveSupport::TestCase
  test "should be a valid email" do
    assert ::Validators::Email.valid?('dev@example.com')
  end

  test "should not be a valid, email is nil" do
    assert_not ::Validators::Email.valid?(nil)
  end

  test "should not be a valid, email is blank" do
    assert_not ::Validators::Email.valid?("")
  end

  test "should not be a valid, email format is incorret" do
    assert_not ::Validators::Email.valid?('dev.example_com')
  end

  test "should not be a valid, email is not a String class" do
    assert_not ::Validators::Email.valid?(42)
  end
end
