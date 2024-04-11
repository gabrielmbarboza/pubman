namespace :pubman do
  desc "Setup for development environment"
  task dev: :environment do
    if Rails.env.development?
      citizens_cns = [ "279 7026 7501 0007", "270 9595 7840 0018", "115 7375 4853 0003", "993 6089 4576 0018",
                       "117 9317 9203 0005", "194 0196 5368 0018", "279 0305 7319 0000", "211 8958 4124 0006",
                       "114 2519 9058 0003", "154 4974 5152 0007", "140 5473 0740 0007", "969 7398 8066 0003",
                       "236 3592 6841 0002", "214 9789 3440 0018", "160 2985 4446 0001", "784 9069 7623 0006",
                       "730 7312 8953 0009", "134 7599 8910 0009", "869 8145 0190 0009", "130 9219 0050 0000",
                       "272 8749 7483 0018", "126 3345 3554 0001", "186 7191 4300 0018", "143 0364 5760 0018",
                       "188 0320 4005 0000", "887 6526 6673 0000", "273 7983 1280 0001", "243 2896 2106 0006",
                       "111 7470 9328 0000", "224 0129 0956 0007"]

      Faker::Config.locale = 'pt-BR'

      states = ::BrAddress::State.codes

      citizens_cns.each_with_index do |cns, idx|
        full_name = Faker::Name.name_with_middle

        state_code = states.sample

        city = ::BrAddress::State.cities(state_code: state_code).sample

        citizen_attributes = {
          full_name: Faker::Name.name_with_middle,
          cpf: Faker::IdNumber.brazilian_citizen_number(formatted: true),
          cns: cns,
          email: Faker::Internet.email(name: full_name, separators: %w(. _ -)),
          date_of_birth: Faker::Date.between(from: 70.years.ago, to: 30.days.ago),
          phone: Faker::PhoneNumber.cell_phone_with_country_code,
          status: rand(0..1),
          address_attributes: {
            zip_code: "#{Faker::Number.number(digits: 5)}-#{Faker::Number.number(digits: 3)}",
            street: Faker::Address.street_name,
            address_number: Faker::Address.building_number ,
            complement: Faker::Address.secondary_address,
            neighborhood: Faker::Address.community,
            city: city,
            state: state_code }
        }

        citizen = Citizen.create!(citizen_attributes)
        photo_name = "citizen_#{idx + 1}.jpeg"

        citizen.photo.attach( io: File.open(Rails.root.join("db","images", photo_name).to_s), filename: photo_name)
      end
    end
  end
end
