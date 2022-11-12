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
# :w
# where '<<photo_name>>', '<\<extension>>' and, '<<city_name>>' consist only of letters of the English alphabet.
#
#
# Write a function that, given a string representing the list of `M` photos, returns the string representing the list of the new names of all photos (the order of photos should stay the same).

def solution(string)
  # convert the string input into an array of M elements
  parse(string)
  # validate that the array is not longer than 100 elements and less than 1
  # create a model per record that helps to sort them in proper way
  # # validate the extensions in the model
  # # validate the name of the city starts with a Capital letter
  # # validate the uniqueness of the time per photo record
  # # complete the sequence for the photo based on the list length
  # create a system for tag each photo in a sequential way
end

def parse(string)
  lines = string.split("\n")
  photo_records = []
  lines.each do |line|
    photo_name, city_name, timestamp = line.split(',')
    photo_records << PhotoRecord.new(photo_name: photo_name,
                                     city_name: city_name,
                                     timestamp: DateTime.parse(timestamp))
  end
  binding.pry
  photo_records
end

raw_inputs = <<-PHT
photo.jpg, Krakow, 2013-09-05 14:08:15
Mike.png, London, 2015-06-20 15:13:22
myFriends.png, Krakow, 2013-09-05 14:07:13
Eiffel.jpg, Florianopolis, 2015-07-23 08:03:02
pisatower.jpg, Florianopolis, 2015-07-22 23:59:59
BOB.jpg, London, 2015-08-05 00:02:03
notredame.png, Florianopolis, 2015-09-01 12:00:00
me.jpg, Krakow, 2013-09-06 15:40:22
a.png, Krakow, 2016-02-13 13:33:50
b.jpg, Krakow, 2016-01-02 15:12:22
c.jpg, Krakow, 2016-01-02 14:34:30
d.jpg, Krakow, 2016-01-02 15:15:01
e.png, Krakow, 2016-01-02 09:49:09
f.png, Krakow, 2016-01-02 10:55:32
g.jpg, Krakow, 2016-02-29 22:13:11
PHT

solution(raw_inputs)

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


