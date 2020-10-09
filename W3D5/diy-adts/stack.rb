#!/usr/bin/env ruby
# frozen_string_literal: true

class Stack
  def initialize
    # create ivar to store stack here!
    @ivar = []
  end

  def push(el)
    # adds an element to the stack
    @ivar << el
  end

  def pop
    # removes one element from the stack
    @ivar.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @ivar[-1]
  end
end

if __FILE__ == $PROGRAM_NAME
  stack = Stack.new
  stack.push 1
  puts stack.peek == 1
  puts stack.pop == 1
end
