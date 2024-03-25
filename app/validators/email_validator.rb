class EmailValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless ::Validators::Email.valid?(value)
      record.errors.add(attribute, :email_blank, message: 'is not a valid email')
    end
  end
end
