# frozen_string_literal: true
#
require_relative 'valid_routing_number'

class RoutingNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    value = value.to_s.gsub(/[^\d]/, '')

    if value.blank? || value.to_s.size != 9
      record.errors[attribute] << (options[:message] || "routing number must be 9 digits long")
    elsif !ValidRoutingNumber.call(value)
      record.errors[attribute] << (options[:message] || "invalid routing number. Failed checksum.")
    end
  end
end
