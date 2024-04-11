module BrAddress
  class State
    def self.find_by_code(code:)
      return {} unless code.present?

      state_file_path = Rails.root.join('config', 'address', 'states', "#{code}.yml").to_s
      code = code.downcase

      return {} if !codes.include?(code.to_sym) || !File.exist?(state_file_path)

      YAML.load(File.open(state_file_path))
    end

    def self.all
      {
        ac: 'Acre',
        al: 'Alagoas',
        ap: 'Amapá',
        am: 'Amazonas',
        ba: 'Bahia',
        ce: 'Ceará',
        df: 'Distrito Federal',
        es: 'Espírito Santo',
        go: 'Goiás',
        ma: 'Maranhão',
        mt: 'Mato Grosso',
        ms: 'Mato Grosso do Sul',
        mg: 'Minas Gerais',
        pa: 'Pará',
        pb: 'Paraíba',
        pr: 'Paraná',
        pe: 'Pernambuco',
        pi: 'Piauí',
        rj: 'Rio de Janeiro',
        rn: 'Rio Grande do Norte',
        rs: 'Rio Grande do Sul',
        ro: 'Rondônia',
        rr: 'Roraima',
        sc: 'Santa Catarina',
        sp: 'São Paulo',
        se: 'Sergipe',
        to: 'Tocantins'
      }
    end

    def self.codes
      all&.keys || {}
    end

    def self.names
      all&.values || {}
    end

    def self.cities(state_code:)
      return [] unless state_code.present?

      state_info = find_by_code(code: state_code)

      return [] unless state_info.present?

      state_info['state']['cities']
    end
  end
end
