#!/usr/bin/env ruby
# frozen_string_literal: true

class Queue
  def initialize
    @ivar = []
  end

  def enqueue(el)
    @ivar << el
  end

  def dequeue
    @ivar.shift
  end

  def peek
    @ivar[0]
  end
end

if __FILE__ == $PROGRAM_NAME
  q = Queue.new
  q.enqueue 1
  q.enqueue 2
  puts q.peek == 1
  puts q.dequeue == 1
end
