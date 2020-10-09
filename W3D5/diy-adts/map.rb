#!/usr/bin/env ruby
# frozen_string_literal: true
class Map
  def initialize
    @dat = []
  end

  def set(key, value)
    ind = @dat.find_index { |elem| key == elem[0] }
    if ind
      @dat[ind] = [key, value]
    else
      @dat << [key, value]
    end
    self
  end

  def get(key)
    res = @dat.assoc key
    res && res[1] || nil
  end

  def delete(key)
    ind = @dat.find_index { |elem| key == elem[0] }
    ind && @dat.delete_at(ind)
    self
  end

  def show
    @dat.each do |k, v|
      puts "#{k} => #{v}"
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  m = Map.new
  m.set('a', 5).set('b', 6)
  puts m.get('c') == nil
  puts m.get('a') == 5
  m.show
end
