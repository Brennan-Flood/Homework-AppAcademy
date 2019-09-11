class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      unless i == 6 || i == 13
        4.times {@cups[i] << :stone}
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if !(0..13).include?(start_pos)
    raise 'Starting cup is empty' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stone_count = @cups[start_pos].length
    @cups[start_pos] = Array.new
    i = start_pos + 1
    count = 0
    while count < stone_count
      if i == 6 || i == 13
        i += 1
      end
      @cups[i] << :stone
      i += 1
      count += 1
    end
    end_idx = i
    if @cups[end_idx].length == 1

    end
    render
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
    false
  end

  def winner
    
  end
end
