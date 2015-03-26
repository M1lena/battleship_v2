require 'fishing_boat'

describe FishingBoat do
  context 'fishing boats have size and placement' do
    it 'Fishing boats can have size of 2' do
      expect(subject.size).to eq 2
    end
  end
end
