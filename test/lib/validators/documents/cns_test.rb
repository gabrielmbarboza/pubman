require "test_helper"

class CnsTest < ActiveSupport::TestCase
  test "the CNS must be valid starting with the digit 1" do
    assert ::Validators::Documents::Cns.valid?('171 1008 9186 0007')
  end

  test "the CNS must be valid starting with the digit 2" do
    assert ::Validators::Documents::Cns.valid?('267 6410 4171 0001')
  end

  test "the CNS must be valid starting with the digit 7" do
    assert ::Validators::Documents::Cns.valid?('750 6145 0106 0005')
  end

  test "the CNS must be valid starting with the digit 8" do
    assert ::Validators::Documents::Cns.valid?('823 5816 1531 0008')
  end

  test "the CNS must be valid starting with the digit 9" do
    assert ::Validators::Documents::Cns.valid?('916 9480 2118 0000')
  end

  test "should not be valid, the CNS length is greater than 15" do
    assert_not ::Validators::Documents::Cns.valid?('8862 5319 0200 0008')
  end

  test "should not be valid, the CNS length is less than 15" do
    assert_not ::Validators::Documents::Cns.valid?('62 5319 0200 0008')
  end

  test "should not be valid, the CNS must only contain digits" do
    assert_not ::Validators::Documents::Cns.valid?('962 5El9 0200 0008')
  end

  test "the CNS must not be valid starting with digits between 3 and 6" do
    (3..6).to_a.each do |first_digit|
      assert_not ::Validators::Documents::Cns.valid?("#{first_digit}62 5319 0200 0008")
    end
  end

  test "must not be valid, the CNS is nil" do
    assert_not ::Validators::Documents::Cns.valid?(nil)
  end
end
