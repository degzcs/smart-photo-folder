require 'pry'
require './model/photo_record.rb'
# extensions: jpg, png, jpeg
# example: "photo.jpg, Krakow, 2013-09-05 14:08:15"
# group the photos by city
# sort photos by date
# assign sequential numbers starting from 1, this number should
# be the same length for each one, equals to the largest number of the group
#
# new photo name format:
# '<\<photoname>>.<\<extension>>, <<city_name>>, yyyy-mm-dd, hh:mm:ss",
# where '<<photo_name>>', '<\<extension>>' and, '<<city_name>>' consist only of letters of the English alphabet.
#
#
# Write a function that, given a string representing the list of `M` photos, returns the string representing the list of the new names of all photos (the order of photos should stay the same).

def solution(string)
  photo_records = parse(string)
  raise 'The input is too larger' if photo_records.size > 100
  generator = FileNamesGenerator.new(photo_records)
  generator.call
  puts 'Final names are:'
  puts generator.final_names
end

def parse(string)
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

outputs = [
'Krakow02.jpg',
'London1.png',
'Krakow01.png',
'Florianopolis2.jpg',
'Florianopolis1.jpg',
'London2.jpg',
'Florianopolis3.png',
'Krakow03.jpg',
'Krakow09.png',
'Krakow07.jpg',
'Krakow06.jpg',
'Krakow08.jpg',
'Krakow04.png',
'Krakow05.png',
'Krakow10.jpg',
]


