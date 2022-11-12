require_relative '../model/photo_record.rb'

class Parser
  def self.parse(string)
    return if string.nil?

    lines = string.split("\n")
    photo_records = []
    lines.each do |line|
      photo_name, city_name, timestamp = line.split(',')
      photo_records << PhotoRecord.new(photo_name: photo_name.strip,
                                       city_name: city_name.strip,
                                       timestamp: DateTime.parse(timestamp),
                                       seq_number: nil)
    end
    photo_records
  end
end
