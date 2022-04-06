# frozen_string_literal: true

require_relative "priority_queue/version"

# module PriorityQueue
#   class Error < StandardError; end
# end

class PriorityQueue
  class Error < StandardError; end

  def initialize
    @items = [nil]
  end

  def size
    @items.size - 1
  end

  def top
    @items[1]
  end

  def push(item)
    @items << item
    bubble_up(@items.size - 1)
  end

  def <<(item)
    push(item)
  end

  def pop
    swap(1, @items.size - 1) # change 1st with last
    max = @items.pop
    bubble_down(1) # make sure it is still ordered
    max
  end

  private

  def swap(source, target)
    @items[source], @items[target] = @items[target], @items[source]
  end

  def bubble_down(index)
    child_index = (index * 2)
    return if child_index > @items.size - 1

    # make sure we get the largest child
    not_the_last_item = child_index < @items.size - 1
    left_item = @items[child_index]
    right_item = @items[child_index + 1]
    child_index += 1 if not_the_last_item && right_item > left_item

    return if @items[index] >= @items[child_index]

    swap(index, child_index)
    bubble_down(child_index)
  end

  def bubble_up(index)
    parent_index = (index / 2)
    return if index <= 1
    return if @items[parent_index] >= @items[index]

    swap(index, parent_index)
    bubble_up(parent_index)
  end
end
