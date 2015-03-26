class Ship
  attr_reader :size, :sunk
  attr_accessor :hit_counter

  def initialize
    @size = 1
    @hit_counter = 0
    @sunk = false
  end

  def hit!
    @hit_counter += 1
    sink
  end

  def sink
    @sunk = true if @hit_counter == @size
  end
end
