require 'rspec'
require_relative '../photo_challenge.rb'

RSpec.describe 'Integration' do
  let(:long_input_string) do
    <<-PHT
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
  end

  context 'happy path' do
    let(:outputs) do
      [
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
    end

    it 'generates a list with the right outputs' do
      expect(solution(long_input_string)).to eq outputs
    end
  end
end
