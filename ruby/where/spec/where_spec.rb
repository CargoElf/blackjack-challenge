require_relative '../where'

RSpec.describe ArrayExtension::Where do

  let(:boris)   { {name: 'Boris The Blade', quote: "Heavy is good. Heavy is reliable. If it doesn't work you can always hit them.", title: 'Snatch', rank: 4} }
  let(:charles) { {name: 'Charles De Mar', quote: 'Go that way, really fast. If something gets in your way, turn.', title: 'Better Off Dead', rank: 3}}
  let(:wolf)    { {name: 'The Wolf', quote: 'I think fast, I talk fast and I need you guys to act fast if you wanna get out of this', title: 'Pulp Fiction', rank: 4} }
  let(:glen)    { {name: 'Glengarry Glen Ross', quote: "Put. That coffee. Down. Coffee is for closers only.",  title: "Blake", rank: 5} }

  let(:characters) { [boris, charles, wolf, glen] }

  it 'test_where_with_exact_match' do
    expect(characters.where(name: 'The Wolf')).to eq [wolf]
  end

  it 'test_where_with_partial_match' do
    expect(characters.where(title: /^B.*/)).to eq [charles, glen]
  end

  it 'test_where_with_mutliple_exact_results' do
    expect(characters.where(rank: 4)).to eq [boris, wolf]
  end

  it 'test_with_with_multiple_criteria' do
    expect(characters.where(rank: 4, quote: /get/)).to eq [wolf]
  end

  it 'test_with_chain_calls' do
    expect(characters.where(quote: /if/i).where(:rank => 3)).to eq [charles]
  end

  it 'returns an empty array when no matches found' do
    expect(characters.where(quote: 'ummmmmm....')).to eq []
  end

  it 'returns all elements of array when no args given' do
    expect(characters.where).to eq characters
  end

  it 'raise error if attribute is not found' do
    expect { characters.where(name: 'The Wolf', a: 'What am I?') }.to raise_error ArgumentError, "Invalid attribute: 'a'"
  end

end
