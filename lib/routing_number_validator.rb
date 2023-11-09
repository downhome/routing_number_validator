# frozen_string_literal: true
#
require_relative 'valid_routing_number'

class RoutingNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    case ValidRoutingNumber.call(value)
    when :invalid_length
      record.errors[attribute] << (options[:message] || "routing number must be 9 digits long")
    when :invalid_checksum
      record.errors[attribute] << (options[:message] || "invalid routing number. Failed checksum.")
    end
  end
end
