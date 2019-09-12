class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
    play
  end

  def play
    add_random_color
    show_sequence
    until game_over == true
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if !game_over 
      round_success_message
      @sequence_length += 1
      add_random_color
    end
  end

  def show_sequence
    puts seq
    add_random_color
  end

  def require_sequence
    puts "Enter the sequence"
    user_input = gets.chomp.split
    game_over = true if user_input != seq
    false

  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "You won this round..."
  end

  def game_over_message
    puts 'You lose!'
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

game = Simon.new
game.play