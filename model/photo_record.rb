require 'dry-types'
require 'dry-struct'

module Types
  include Dry.Types()
end

# TODO:
# create a model per record that helps to sort them in proper way
# # validate the extensions in the model [done]
# # validate the name of the city starts with a Capital letter [done]
# # validate year from 2000 - 2020
class PhotoRecord < Dry::Struct
  attribute :photo_name, Types::Strict::String.constrained(
    format: /[^\s]+(\.)(?i)(jpe?g|png)$/
  )
  attribute :city_name, Types::Strict::String.constrained(
    format: /^[A-Z].+/
  )
  attribute :timestamp, Types::Strict::DateTime # TODO: set time based on location: time zone
  attribute :seq_number, Types::Strict::String.optional

  def seq_number=(value)
    @attributes = attributes.merge!(seq_number: value.to_s)
  end

  def extension
    photo_name.gsub(/[^\s]+(\.)/, '')
  end
end
