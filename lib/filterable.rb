require 'filterable/version'

module Filterable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    # Iterates over params hash and
    # applies non-empty values as filters
    # @param params [Hash] filters list
    # @return [ActiveRecord::Relation] filtered list
    def filter(params)
      results = where(nil)
      params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end
