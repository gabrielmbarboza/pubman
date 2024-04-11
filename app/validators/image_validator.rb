class ImageValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.blob.byte_size <= 1.megabyte
      record.errors.add(attribute, :photo_is_too_big, message: 'is too big')
    end

    valid_types = ["image/jpeg", "image/png"]

    unless valid_types.include?(main_image.content_type)
      record.errors.add(attribute, :photo_type_error, "must be a JPEG or PNG")
    end
  end
end
