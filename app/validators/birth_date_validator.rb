class BirthDateValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless ::Validators::BirthDate.valid?(value)
      record.errors.add(attribute, :birth_date_is_not_valid, message: 'is not a birth date valid')
    end
  end
end
