class FileNamesGenerator
  attr_reader :photo_records, :final_names, :groups

  def initialize(photo_records:)
    @photo_records = photo_records
    @groups = {}
  end

  def call
    # TODO:
    # create a system for tag each photo in a sequential way
    generate_groups!
    group_names = groups.keys
    group_names.each do |group_name|
      seq_length = groups[group_name].size
      # sort photo_records by date
      # set the seq number
    end

    #mix all groups and sort them by date
  end

  # group photos by city
  def generate_groups!
    photo_records.each do |photo_record|
      key = key_for(photo_record)
      next if key.nil?

      @groups[key] = [] if @groups[key].nil?
      @groups[key] <<  photo_record
    end
  end

  def key_for(photo_record)
    photo_record.city_name.downcase.to_sym
  end
end
