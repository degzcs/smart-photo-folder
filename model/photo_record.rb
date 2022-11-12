require 'dry-types'
require 'dry-struct'

module Types
  include Dry.Types()
end

class PhotoRecord < Dry::Struct
    attribute :photo_name, Types::Strict::String
    attribute :city_name, Types::Strict::String
    attribute :timestamp, Types::Strict::DateTime # TODO: set time based on location: time zone
end
