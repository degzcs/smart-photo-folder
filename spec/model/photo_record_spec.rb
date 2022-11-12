require_relative '../../model/photo_record.rb'
require 'pry'

RSpec.describe 'PhotoRecord' do
  let(:city_name) { 'Popayan'  }
  let(:photo_name) { 'photo.jpg' }
  let(:timestamp) { DateTime.now }

  context 'validations' do
    let(:wrong_photo_name) { 'test.fxt' }
    let(:wrong_timestamp) { 'this is not a date' }
    let(:wrong_city_name) { 'popayan' }

    it 'accepts all inputs as valid' do
      record = PhotoRecord.new(photo_name: photo_name,
                               city_name: city_name,
                               timestamp: timestamp)
      expect(record).not_to be nil
    end

    it 'raise an error becuase the photo name is incorrect' do
      expect do
        PhotoRecord.new(photo_name: wrong_photo_name,
                               city_name: city_name,
                               timestamp: timestamp)
      end.to raise_error /:photo_name violates constraints/
    end

    it 'raise an error becuase the timestamp is incorrect' do
      expect do
        PhotoRecord.new(photo_name: photo_name,
                               city_name: city_name,
                               timestamp: wrong_timestamp)
      end.to raise_error /:timestamp violates constraints/
    end

    it 'raise an error becuase the city_name is incorrect' do
      expect do
        PhotoRecord.new(photo_name: photo_name,
                               city_name: wrong_city_name,
                               timestamp: timestamp)
      end.to raise_error /:city_name violates constraints/
    end

    xit 'raises an error when there is more than one record with the same time' do
    end
  end
end
