require 'ship'

describe Ship do
  context 'ship features' do
    it 'has a size' do
      expect(subject.size).to eq 1
    end
    it 'has a hit counter' do
      expect(subject.hit_counter).to eq 0
    end
  end
  context 'sinking a ship' do
    it 'starts with a sunk status' do
      expect(subject.sunk).to eq false
    end
    xit 'can be sunk' do
      expect(subject.sunk).to eq true
    end
  end
end
