class Board
  attr_accessor :cups

  def initialize(name1, name2)
    # 1..6, 7..12
    @cups = Array.new(14) { Array.new(4) { :stone } }
    @cups[6] = @cups[13] = []
    @player1 = name1
    @player2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos >= 13
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  # if player ends in own cup, return :prompt
  # return ending_cup_idx
  def make_move(start_pos, current_player_name)
    opponent_store = current_player_name == @player1 ? 13 : 6
    stones = @cups[start_pos].size
    @cups[start_pos] = []

    while stones.positive?
      start_pos = (1 + start_pos) % @cups.length
      next if start_pos == opponent_store

      @cups[start_pos].push(:stone)
      stones -= 1
    end
    render
    return next_turn(start_pos, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    # opponent_store = current_player_name == @player1 ? 13 : 6
    our_store = current_player_name == @player1 ? 6 : 13
    return :prompt if ending_cup_idx == our_store
    return :switch if @cups[ending_cup_idx].empty?

    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[1..6].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner

  end
end
