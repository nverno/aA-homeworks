#!/usr/bin/env ruby
# frozen_string_literal: true

class GraphNode
  attr_accessor :value, :neighbors
  def initialize(value, neighbors=[])
    @value = value
    @neighbors = neighbors
  end

  def bfs(start, target)
    require 'set'
    q = [start]
    seen = Set.new [start]
    until q.empty?
      curr = q.shift
      return curr if curr.value == target

      curr.neighbors.each { |neb| q << neb unless seen.include?(neb) }
    end
    nil
  end
end

if __FILE__ == $PROGRAM_NAME
  a = GraphNode.new('a')
  b = GraphNode.new('b')
  c = GraphNode.new('c')
  d = GraphNode.new('d')
  e = GraphNode.new('e')
  f = GraphNode.new('f')
  a.neighbors = [b, c, e]
  c.neighbors = [b, d]
  e.neighbors = [a]
  f.neighbors = [e]

  res = f.bfs(f, 'a')
  puts "Found #{res.value}" if res
  if res2 = f.bfs(a, 'f')
    puts "Found #{res2.value}"
  else
    puts "'f' not found from node a"
  end
end
