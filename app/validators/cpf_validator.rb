class CpfValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless ::Validators::Documents::Cpf.valid?(value)
      record.errors.add(attribute, :cpf_is_not_valid, message: 'is not a valid cpf')
    end
  end
end
