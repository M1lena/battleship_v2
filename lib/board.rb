require_relative 'ship'

class Board
  attr_reader :grid

  def initialize
    @grid = { A1: "", A2: "", A3: "", A4: "", A5: "" }
  end

  def place(ship, cell)
    # fail 'More arguements needed' if cell. < @size
    fail 'Can\'t place' unless grid.key?(cell)
    fail 'Can\'t place' if grid[cell] != "" # || @grid.key? :A6
    coords = get_coords ship, cell
    coords.each { |coord| grid[coord] = ship }
  end

  def hit!(cell)
    fail 'Spot has already been hit' if already_hit?(cell)
    fail 'can\'t hit location off board' unless grid.key?(cell)
    grid[cell].hit! if grid[cell].respond_to? :hit_counter
    hit_result(cell)
  end

  def already_hit?(cell)
    grid[cell] == 'X' || grid[cell] == 'O'
  end

  def hit_result(cell)
    if grid[cell] == ""
      grid[cell] = 'O'
    else
      @grid[cell] = 'X'
    end
  end

  def get_coords ship, cell
    coords = [cell]
    (ship.size - 1).times { coords << coords.last.next }
    coords
    # coords.last.to_s.reverse.next.reverse.to_sym
  end

  # def out_of_bounds?
  # end
end
