require_relative 'ship'

class Board
  attr_reader :grid
  def initialize
    @grid = { A1: "", A2: "", A3: "", A4: "", A5: "" }
  end

  def place(ship, cell)
    fail 'Can\'t place' unless @grid.key?(cell)
    fail 'Can\'t place' if @grid[cell] != ""
    @grid[cell] = ship
  end

  def hit!(cell)
    fail 'Spot has already been hit' if @grid[cell] == 'X' || @grid[cell] == 'O'
    fail 'can\'t hit location off board' unless @grid.key?(cell)

    grid[cell].hit! if grid[cell].respond_to? :hit_counter

    @grid[cell] = 'X' if @grid[cell] != ""
    @grid[cell] = 'O' if @grid[cell] == ""

  end
end
