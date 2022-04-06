# frozen_string_literal: true

require "spec_helper"

RSpec.describe PriorityQueue do
  it "has a version number" do
    expect(PriorityQueue::VERSION).not_to be nil
  end

  it "pq testing" do
    pq = PriorityQueue.new()
    pq << 1
    pq << 3
    expect(pq.size).to eq(2)
    expect(pq.top()).to eq(3)
  end
end
