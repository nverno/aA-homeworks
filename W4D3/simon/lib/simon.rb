#!/usr/bin/env ruby
# frozen_string_literal: true
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless @game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    p @seq
  end

  def require_sequence
    puts "Enter the colors as seen (separated by space)"
    ss = gets.chomp.split
    @seq.zip(ss).each do |x, y|
      @game_over = true unless x == y
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Success!"
  end

  def game_over_message
    puts "Game Over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  Simon.new.play
end
