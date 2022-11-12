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
      group = groups[group_name].sort_by! {|line| line[:photo_record].timestamp }
      seq_length = seq_length_for(group)
      group.each_with_index do |line, i|
        seq_number = get_seq_number_by(seq_length, i + 1)
        line[:photo_record].seq_number = seq_number
      end
    end
    generate_names!
  end

  def generate_names!
    sorted_groups = groups.values.flatten.sort_by {|line| line[:index] }
    sorted_groups.map do |line|
      "#{line[:photo_record].city_name}#{line[:photo_record].seq_number}.#{line[:photo_record].extension}"
    end
  end

  def seq_length_for(array)
    array.size.to_s.split('').size
  end

  def generate_groups!
    photo_records.each_with_index do |photo_record, i|
      key = key_for(photo_record)
      next if key.nil?

      @groups[key] = [] if @groups[key].nil?
      @groups[key] << { photo_record: photo_record, index: i + 1 }
    end
  end

  def key_for(photo_record)
    photo_record.city_name.downcase.to_sym
  end

  def get_seq_number_by(seq_length, counter)
    counter.to_s.rjust(seq_length.to_i, '0')
  end
end
