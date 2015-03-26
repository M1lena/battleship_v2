require 'board'

describe Board do
  let(:board) { Board.new }
  let(:ship1) do
    double :ship, sunk: false, hit_counter: 0, :class => Ship, hit!: nil
  end
  context 'can place ships on the board' do
    it 'place ship on board location' do
      board.place(ship1, :A1)
      expect(board.grid).to eq(A1: ship1, A2: "", A3: "", A4: "", A5: "")
    end

    it 'cannot place ship off board location' do
      expect { board.place(ship1, :A6) }.to raise_error 'Can\'t place'
    end

    it 'cannot place ship in another ship\'s place' do
      board.place(ship1, :A1)
      expect { board.place(:ship2, :A1) }.to raise_error 'Can\'t place'
    end

    it 'can place ship on board\'s cell\'s relative to ship size' do
      ship2 = double :ship, size: 2
      board.place(ship2, :A1)
      expect(board.grid).to eq(A1: ship2, A2: ship2, A3: "", A4: "", A5: "")
    end
  end
  context 'can fire at the board' do
    it 'can hit a ship' do
      board.place(ship1, :A1)
      board.hit!(:A1)
      expect(board.grid).to eq(A1: 'X', A2: "", A3: "", A4: "", A5: "")
    end

    it 'can miss a ship' do
      board.place(ship1, :A1)
      board.hit!(:A2)
      expect(board.grid).to eq(A1: ship1, A2: "O", A3: "", A4: "", A5: "")
    end

    it 'can raise an error if empty spot has already been hit' do
      board.hit!(:A2)
      expect { board.hit!(:A2) }.to raise_error 'Spot has already been hit'
    end

    it 'can raise an error if full spot has already been hit' do
      board.place(ship1, :A1)
      board.hit!(:A1)
      expect { board.hit!(:A1) }.to raise_error 'Spot has already been hit'
    end

    it 'can\'t hit location not on the board' do
      expect { board.hit!(:A6) }.to raise_error 'can\'t hit location off board'
    end

    it 'board will receive shot and change ship\'s hit_counter' do
      board.place(ship1, :A1)

      expect(ship1).to receive :hit!

      board.hit!(:A1)
    end
  end
end
