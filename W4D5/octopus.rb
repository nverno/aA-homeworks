#!/usr/bin/env ruby
# frozen_string_literal: true

class Octopus
  FISH = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

  def sluggish
    res = FISH.dup

    (0...FISH.size).each do |i| 
      (i + 1...FISH.size).each do |j|
        res[j], res[i] = res[i], res[j] if res[i].size < res[j].size
      end
    end
    res[0]
  end

  def dominant
    FISH.sort_by { |a| -a.size }[0]
  end

  def clever
    max_len = 0
    max_i = 0
    for i in 0...FISH.size do
      if FISH[i].size > max_len
        max_len = FISH[i].size
        max_i = i
      end
    end
    FISH[max_i]
  end

  TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

  def slow_dance(dir)
    TILES_ARRAY.each.with_index { |tile, i| return i if dir == tile }
  end

  def constant_dance(dir)
    require 'set'
    s = Set.new(TILES_ARRAY)
    s.find_index(dir)
  end
end

if __FILE__ == $PROGRAM_NAME
  o = Octopus.new
  # puts o.sluggish
  # puts o.dominant
  # puts o.clever

  # puts o.slow_dance("up")
  # puts o.slow_dance("right-down")
  puts o.constant_dance("up")
  puts o.constant_dance("right-down")
end
