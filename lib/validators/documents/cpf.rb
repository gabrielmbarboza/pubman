module Validators
  module Documents
    class Cpf
      FACTOR_FIRST_DIGIT = 10
      FACTOR_SECOND_DIGIT = 11
      CPF_SIZE = 11

      def self.valid?(raw_cpf)
        return false unless raw_cpf.present?

        clean_cpf = raw_cpf.gsub(/\D/, "")
        cpf_arr   = clean_cpf&.split("")&.map!(&:to_i)

        return false if cpf_arr.size != CPF_SIZE || cpf_arr.uniq.size <= 1

        cpf = cpf_arr[0..8]

        first_digit = calculate_digit(cpf, FACTOR_FIRST_DIGIT)
        cpf << first_digit

        second_digit = calculate_digit(cpf, FACTOR_SECOND_DIGIT)
        cpf << second_digit

        clean_cpf == cpf.join("")
      end

      private

      def self.calculate_digit(cpf, factor)
        calculated_digit = cpf.zip(Array(2..factor).reverse!).map {|a,b| a * b}.inject(0, :+)
        rest = calculated_digit.divmod(11).last

        rest >= 2 ? (11 - rest) : 0
      end
    end
  end
end
