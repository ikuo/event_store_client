# frozen_string_literal: true

module EventStoreClient
  module StoreAdapter
    module Api
      class RequestMethod
        InvalidMethodError = Class.new(StandardError)
        def ==(other)
          name == other.to_s
        end

        def to_s
          name
        end

        private

        attr_reader :name

        def initialize(name)
          raise InvalidMethodError unless name.to_s.in?(SUPPORTED_METHODS)

          @name = name.to_s
        end

        SUPPORTED_METHODS = %w[get post put].freeze
      end
    end
  end
end