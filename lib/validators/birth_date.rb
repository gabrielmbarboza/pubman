module Validators
  class BirthDate
    def self.valid?(birth_date)
      current_date = Date.current

      return false if birth_date.nil? || !(birth_date.is_a?(Date)) || birth_date > current_date

      birth_date.between?(( current_date - 120.years ).beginning_of_day, ( current_date - 1.week ).end_of_day )
    end
  end
end
