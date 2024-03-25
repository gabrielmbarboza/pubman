class CnsValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless ::Validators::Documents::Cns.valid?(value)
      record.errors.add(attribute, :cns_is_not_valid, message: 'is not a valid cns')
    end
  end
end
