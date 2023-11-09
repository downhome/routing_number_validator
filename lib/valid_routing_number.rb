# frozen_string_literal: true

# source: https://en.wikipedia.org/wiki/ABA_routing_transit_number#Internal_checksums
class ValidRoutingNumber
  def self.call(routing_number)
    routing_number = "%09d" % routing_number.to_s.gsub(/[^\d]/, '')
    digits = routing_number.split('').map(&:to_i)

    checksum = digits
      .each_slice(3)
      .map{|a,b,c| a * 3 + b * 7 + c}
      .sum

    0 === checksum % 10
  end
end
