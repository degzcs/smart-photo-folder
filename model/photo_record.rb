require 'dry-types'
require 'dry-struct'

module Types
  include Dry.Types()
end

# TODO:
# create a model per record that helps to sort them in proper way
# # validate the extensions in the model
# # validate the name of the city starts with a Capital letter
# # validate the uniqueness of the time per photo record
# # complete the sequence for the photo based on the list length
class PhotoRecord < Dry::Struct
  attribute :photo_name, Types::Strict::String
  attribute :city_name, Types::Strict::String
  attribute :timestamp, Types::Strict::DateTime # TODO: set time based on location: time zone
end
