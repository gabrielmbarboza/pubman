require "test_helper"

class StateTest < ActiveSupport::TestCase
  test "should return the state data" do
    state = ::BrAddress::State.find_by_code(code: :es)['state']

    assert_equal state['code'], 'ES'
    assert_equal state['name'], 'Espírito Santo'
    assert_equal state['region'], 'Sudeste'
    assert_equal state['capital'], 'Vitória'
    assert state['cities'].size == 78
  end

  test "should return an empty Hash, state is invalid" do
    state = ::BrAddress::State.find_by_code(code: nil)
    assert_instance_of Hash, state
    assert_empty state

    state = ::BrAddress::State.find_by_code(code: '')
    assert_instance_of Hash, state
    assert_empty state

    state = ::BrAddress::State.find_by_code(code: :rb)
    assert_instance_of Hash, state
    assert_empty state
  end

  test "should return all states" do
    codes = %i(ac al ap am ba ce df es go ma mt ms mg pa pb pr pe pi rj rn rs ro rr sc sp se to)
    state_names = ['Acre', 'Alagoas', 'Amapá', 'Amazonas', 'Bahia', 'Ceará', 'Distrito Federal',
                   'Espírito Santo', 'Goiás', 'Maranhão', 'Mato Grosso', 'Mato Grosso do Sul',
                   'Minas Gerais', 'Pará', 'Paraíba', 'Paraná', 'Pernambuco', 'Piauí', 'Rio de Janeiro',
                   'Rio Grande do Norte', 'Rio Grande do Sul', 'Rondônia', 'Roraima', 'Santa Catarina',
                   'São Paulo', 'Sergipe', 'Tocantins']

    state_codes = ::BrAddress::State.all

    assert state_codes.keys.size == codes.size

    codes.each do |code|
      assert state_codes.keys.include?(code)
      assert state_names.include?(state_codes[code.to_sym])
    end
  end

  test "should return all codes" do
    codes = %i(ac al ap am ba ce df es go ma mt ms mg pa pb pr pe pi rj rn rs ro rr sc sp se to)
    state_codes = ::BrAddress::State.codes

    assert state_codes.size == codes.size

    codes.each do |code|
      assert state_codes.include?(code)
    end
  end

  test "should return all names" do
    names = ['Acre', 'Alagoas', 'Amapá', 'Amazonas', 'Bahia', 'Ceará', 'Distrito Federal',
             'Espírito Santo', 'Goiás', 'Maranhão', 'Mato Grosso', 'Mato Grosso do Sul',
             'Minas Gerais', 'Pará', 'Paraíba', 'Paraná', 'Pernambuco', 'Piauí', 'Rio de Janeiro',
             'Rio Grande do Norte', 'Rio Grande do Sul', 'Rondônia', 'Roraima', 'Santa Catarina',
             'São Paulo', 'Sergipe', 'Tocantins']
    state_names = ::BrAddress::State.names

    assert state_names.size == names.size

    names.each do |name|
      assert state_names.include?(name)
    end
  end

  test "should return the state's cities" do
    cities = ['Acrelândia','Assis Brasil','Brasiléia','Bujari','Capixaba','Cruzeiro do Sul',
              'Epitaciolândia','Feijó','Jordão','Mâncio Lima','Manoel Urbano','Marechal Thaumaturgo',
              'Plácido de Castro','Porto Acre','Porto Walter','Rio Branco','Rodrigues Alves',
              'Santa Rosa do Purus','Sena Madureira','Senador Guiomard','Tarauacá','Xapuri']

    state_cities = ::BrAddress::State.cities(state_code: :ac)

    assert state_cities.size == cities.size

    cities.each do |city|
      assert state_cities.include?(city)
    end
  end

  test "should return the empty Array, the state code is invalid" do
    state_cities = ::BrAddress::State.cities(state_code: :rb)
    assert_instance_of Array, state_cities
    assert_empty state_cities

    state_cities = ::BrAddress::State.cities(state_code: '')
    assert_instance_of Array, state_cities
    assert_empty state_cities

    state_cities = ::BrAddress::State.cities(state_code: nil)
    assert_instance_of Array, state_cities
    assert_empty state_cities
  end
end
