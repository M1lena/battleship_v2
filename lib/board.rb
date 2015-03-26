require_relative 'ship'

class Board
  attr_reader :grid
  def initialize
    @grid = { A1: "", A2: "", A3: "", A4: "", A5: "" }
  end

  def place(ship, cell)
    # fail 'More arguements needed' if cell. < @size
    fail 'Can\'t place' unless @grid.key?(cell)
    fail 'Can\'t place' if @grid[cell] != ""
    @grid[cell] = ship
  end

  def hit!(cell)
    fail 'Spot has already been hit' if already_hit?(cell)
    fail 'can\'t hit location off board' unless @grid.key?(cell)

    grid[cell].hit! if grid[cell].respond_to? :hit_counter

    # @grid[cell] = 'X' if @grid[cell] == :ship
    # @grid[cell] = 'O' if @grid[cell] == ""
    hit_result(cell)
  end

  def already_hit?(cell)
    true if @grid[cell] == 'X' || @grid[cell] == 'O'
  end

  def hit_result(cell)
    if @grid[cell] == ""
      @grid[cell] = 'O'
    else
      @grid[cell] = 'X'
    end
  end
end


# iterate over the hash and look up a key such as a1
# find the length of the ship
# then you want to fill each value with 'ship'
#

# m = ship.size
# cell

# build loop with next basedon size