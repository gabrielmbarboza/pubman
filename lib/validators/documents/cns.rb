module Validators
  module Documents
    # This class is based on the validation algorithm described on the e-SUS page.
    # It can be found at https://integracao.esusab.ufsc.br/v211/docs/algoritmo_CNS.html.
    class Cns
      def self.valid?(raw_cns)
        return false unless raw_cns.present?

        cns  = raw_cns.gsub(/\s/, '')

        return false if cns.length != 15 || !(cns !~ /\D/)

        if ['1', '2'].include?(raw_cns[0])
          return valid_start_with_one_or_two?(cns)
        elsif ['7', '8', '9'].include?(raw_cns[0])
          return valid_start_between_7_and_9?(cns)
        end
      end

      private

      def self.valid_start_with_one_or_two?(cns)
        pis = cns[0..10]
        result = ""

        accumulated = sum_digits(pis)

        rest = accumulated % 11
        check_digit = 11 - rest

        check_digit = 0 if check_digit == 11

        if check_digit == 10
          rest = (accumulated + 2) % 11
          check_digit = 11 - rest
          result =  "#{pis}001#{check_digit}"
        else
          result = "#{pis}000#{check_digit}"
        end

        cns.to_s.eql?(result)
      end

      def self.valid_start_between_7_and_9?(cns)
        accumulated = sum_digits(cns)

        rest = accumulated % 11

        rest.zero?
      end

      def self.sum_digits(value)
        cns_arr = value.chars.map(&:to_i)
        (0..(value.length - 1)).inject(0) { |sum, i| sum + (cns_arr[i] * (15 - i)) }
      end
    end
  end
end
