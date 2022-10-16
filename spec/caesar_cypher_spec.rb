require './caesar-cypher'

describe '#caesar_cypher' do
  it 'accepts a string and a number (key) and convert to an encoded one' do
    expect(caesar_cypher('abcxyz', 53)).to eql ('bcdyza')
    expect(caesar_cypher('abcxyz!', 1)).to eql ('bcdyza!')
    expect(caesar_cypher('abcxyz', -26)).to eql ('abcxyz')
    expect(caesar_cypher('abcxyz', 26)).to eql ('abcxyz')
  end
end
