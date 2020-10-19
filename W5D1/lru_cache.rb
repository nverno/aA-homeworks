#!/usr/bin/env ruby
# frozen_string_literal: true

class LRUCache # rubocop:todo Style/Documentation
  def initialize(size)
    @size = size
    @store = []
  end

  def count
    # returns number of elements currently in cache
    @store.size
  end

  def add(el) # rubocop:todo Naming/MethodParameterName
    # adds element to cache according to LRU principle
    if @store.include?(el)
      @store.delete(el)
    elsif count > @size
      @store.shift
    end
    @store << el
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @store; nil
  end

  # helper methods go here!
end

if __FILE__ == $PROGRAM_NAME
  johnny_cache = LRUCache.new(4)

  johnny_cache.add('I walk the line')
  johnny_cache.add(5)

  p johnny_cache.count # => returns 2

  johnny_cache.add([1, 2, 3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({ a: 1, b: 2, c: 3 })
  johnny_cache.add([1, 2, 3, 4])
  johnny_cache.add('I walk the line')
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add('I walk the line')
  johnny_cache.add({ a: 1, b: 2, c: 3 })

  p johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
end
