require 'mail'
require 'active_model/validations'

module ActiveModel
  module Validations
    class EmailValidator < ActiveModel::EachValidator
      def validate_each record, attr, value
        begin
          tree = Mail::AddressList.new(value).address_nodes.first
          valid = tree.respond_to?(:local_part) && tree.respond_to?(:domain) && tree.domain.dot_atom_text.elements.size > 1
        rescue Mail::Field::ParseError => err
          valid = false
        end

        record.errors.add attr, :invalid, options unless valid
      end
    end
  end
end