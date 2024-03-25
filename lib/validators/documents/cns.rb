module Validators
  module Documents
    # This class is based on the validation algorithm described on the e-SUS page.
    # It can be found at https://integracao.esusab.ufsc.br/v211/docs/algoritmo_CNS.html.
    class Cns
      def self.valid?(raw_cns)
        return false unless raw_cns.present?

        cns     = raw_cns.gsub(/\s/, '')
        result  = ''

        return false if cns.length != 15 || !(cns !~ /\D/)

        pis = cns[0..10]
        multiplier = 15
        accumulated = 0

        11.times do |idx|
          accumulated += pis[idx].to_i * multiplier
          multiplier -= 1
        end

        rest = accumulated % 11

        if ['1', '2'].include?(raw_cns[0])
          result = cns_start_with_one_or_two(rest, pis, accumulated)
        elsif ['7', '8', '9'].include?(raw_cns[0])
          return rest != 0
        end

        return false unless cns.eql?(result)

        true
      end

      private

      def self.cns_start_with_one_or_two(rest, pis, accumulated)
        check_digit = 11 - rest

        check_digit = 0 if check_digit == 11

        return "#{pis}000#{check_digit}" unless check_digit == 10

        accumulated += 2

        rest = accumulated % 11
        check_digit = 11 - rest

        "#{pis}001#{check_digit}"
      end
    end
  end
end
