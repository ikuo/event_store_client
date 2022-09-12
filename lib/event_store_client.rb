# frozen_string_literal: true

module EventStoreClient
end

require 'event_store_client/types'

require 'event_store_client/serializer/json'

require 'event_store_client/mapper'

require 'event_store_client/extensions/options_extension'

require 'event_store_client/utils'

require 'event_store_client/connection/url'
require 'event_store_client/connection/url_parser'
require 'event_store_client/event'
require 'event_store_client/deserialized_event'
require 'event_store_client/configuration'
require 'event_store_client/deserialized_event'

require 'event_store_client/adapters/grpc'
