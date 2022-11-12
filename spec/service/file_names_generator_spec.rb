require_relative '../../service/file_name_generator.rb'
require_relative '../../model/photo_record.rb'
require 'pry'

RSpec.describe FileNamesGenerator do
  subject do
    FileNamesGenerator.new(photo_records: photo_records)
  end
  let(:photo_record_1) do
    PhotoRecord.new(photo_name: 'photo.jpg',
                    city_name: 'Krakow',
                    timestamp: DateTime.parse('2013-09-05 14:08:15'),
                    seq_number: nil)
  end
  let(:photo_record_2) do
    PhotoRecord.new(photo_name: 'Mike.png',
                    city_name: 'London',
                    timestamp: DateTime.parse('2015-06-20 15:13:22'),
                    seq_number: nil)
  end
  let(:photo_record_3) do
    PhotoRecord.new(photo_name: 'myFriends.png',
                    city_name: 'Krakow',
                    timestamp: DateTime.parse('2013-09-05 14:07:13'),
                    seq_number: nil)
  end
  let(:photo_record_4) do
    PhotoRecord.new(photo_name: 'Eiffel.jpg',
                    city_name: 'Florianopolis',
                    timestamp: DateTime.parse('2015-07-23 08:03:02'),
                    seq_number: nil)
  end
  let(:photo_records) do
    [photo_record_1, photo_record_2, photo_record_3, photo_record_4]
  end

  context '#generate_groups!' do
    it 'generate the grops based on city name' do
      subject.generate_groups!
      groups = subject.groups
      expect(groups[:krakow][0][:photo_record]).to eq photo_record_1
      expect(groups[:krakow][0][:index]).to eq 0
      expect(groups[:london][0][:photo_record]).to eq photo_record_2
      expect(groups[:london][0][:index]).to eq 1
    end
  end

  context '#call' do
    it 'creates the final file names' do
      expect(subject.call).to eq(["Krakow2.jpg", "London1.png", "Krakow1.png", "Florianopolis1.jpg"])
    end
  end

  context '#get_seq_number_by' do
    it 'prepends zeros based on params' do
      expect(subject.get_seq_number_by(1, 3)).to eq '3'
      expect(subject.get_seq_number_by(2, 3)).to eq '03'
      expect(subject.get_seq_number_by(3, 3)).to eq '003'
    end
  end

  context '#seq_length_for' do
    it 'gets the right size' do
      expect(subject.seq_length_for([1,1,1])).to eq 1
      expect(subject.seq_length_for([1,1,1,1,1,1,1,1,1,1,1])).to eq 2
    end
  end
end
