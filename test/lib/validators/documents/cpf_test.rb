require "test_helper"

class CpfTest < ActiveSupport::TestCase
  test "should CPF is valid" do
    assert ::Validators::Documents::Cpf.valid?('475.836.561-09')
    assert ::Validators::Documents::Cpf.valid?('47583656109')
  end

  test "should CPF is not valid, the CPF is nil" do
    assert_not ::Validators::Documents::Cpf.valid?(nil)
  end

  test "should CPF is not valid, the CPF length is greater than 11" do
    assert_not ::Validators::Documents::Cpf.valid?('7475.836.561-09')
  end

  test "should CPF is not valid, the CPF length is less than 11" do
    assert_not ::Validators::Documents::Cpf.valid?('75.836.561-09')
  end

  test "should CPF is not valid, the CPF must only contain digits" do
    assert_not ::Validators::Documents::Cpf.valid?('475.BE6.561-09')
  end
end
