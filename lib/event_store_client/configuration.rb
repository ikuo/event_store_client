# frozen_string_literal: true

require 'dry-configurable'

module EventStoreClient
  class << self
    def configure
      yield(config) if block_given?
    end

    def config
      @config ||= Class.new do
        extend Dry::Configurable

        setting :eventstore_url,
                default: 'esdb://localhost:2115',
                constructor:
                  proc { |value|
                    value.is_a?(Connection::Url) ? value : Connection::UrlParser.new.call(value)
                  }
        setting :per_page, default: 20

        setting :mapper, default: Mapper::Default.new

        setting :default_event_class, default: DeserializedEvent

        setting :logger

        setting :skip_deserialization, default: false
        setting :skip_decryption, default: false
      end
      @config.config
    end

    def client
      GRPC::Client.new
    end
  end

  # Configuration module to be included in classes required configured variables
  # Usage: include EventStore::Configuration
  # config.eventstore_url
  #
  module Configuration
    # An instance of the EventStoreClient's configuration
    #
    def config
      EventStoreClient.config
    end
  end
end
