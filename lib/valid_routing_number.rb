# frozen_string_literal: true

# source: https://en.wikipedia.org/wiki/ABA_routing_transit_number#Internal_checksums
class ValidRoutingNumber
  def self.call(routing_number)
    new(routing_number).call

  end

  def initialize(routing_number)
    @routing_number = routing_number.to_s.gsub(/[^\d]/, '')
  end

  def call
    if invalid_length?
      :invalid_length
    elsif invalid_checksum?
      :invalid_checksum
    end
  end

  private
  attr_reader :routing_number

  def invalid_length?
    routing_number.size != 9
  end

  def invalid_checksum?
    digits = routing_number.split('').map(&:to_i)

    checksum = digits
      .each_slice(3)
      .map{|a,b,c| a * 3 + b * 7 + c}
      .sum

    checksum % 10 != 0
  end

end
