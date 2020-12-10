class RoutingNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank? || value.to_s.size != 9
      record.errors[attribute] << (options[:message] || "must be 9 digits long")
    elsif !valid_routing_number?(value)
      record.errors[attribute] << (options[:message] || "prefix must be 01-12 or 21-32")
    end
  end

  private

  # source: https://en.wikipedia.org/wiki/ABA_routing_transit_number#Internal_checksums
  def valid_routing_number?(routing_number)
    digits = routing_number.to_s.gsub(/[^\d]/, '').split('').map(&:to_i)
    0 === (digits.each_slice(3).map{|a,b,c| a*3 + b*7 + c}.sum) % 10
  end
end
