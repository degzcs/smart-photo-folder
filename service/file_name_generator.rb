class FileNamesGenerator
  attr_reader :photo_records, :final_names, :groups

  def initialize(photo_records:)
    @photo_records = photo_records
    @groups = {}
  end

  def call
    generate_groups!
    group_names = groups.keys
    group_names.each do |group_name|
      # sort photo_records by date
      group = groups[group_name].sort!{|line| line[:photo_record].timestamp }
      seq_length = group.size
      group.each_with_index do |line, i|
        seq_number = get_seq_number_by(seq_length, i + 1)
        line[:photo_record].seq_number = seq_number
      end
    end
    groups.values.flatten.sort_by {|ph| ph[:index] }.map{|re| "#{re[:photo_record].city_name}#{re[:photo_record].seq_number}.#{re[:photo_record].extension}" }
  end

  def generate_groups!
    photo_records.each_with_index do |photo_record, i|
      key = key_for(photo_record)
      next if key.nil?

      @groups[key] = [] if @groups[key].nil?
      @groups[key] << { photo_record: photo_record, index: i }
    end
  end

  def key_for(photo_record)
    photo_record.city_name.downcase.to_sym
  end

  def get_seq_number_by(seq_length, counter)
    counter.to_s.rjust(seq_length.to_i, '0')
  end
end
