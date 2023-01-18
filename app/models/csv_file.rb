class CsvFile < ApplicationRecord
  def self.import(file, user_id, time)
    csvfile = self.new(filename: File.basename(file.original_filename, File.extname(file)),
                       user_id: user_id,
                       uploaded: time)
    csvfile.save!
    CsvDatum.import(file, csvfile.id)
  end

  def self.get_file(file_id)
    CsvFile.find_by(id: file_id)
  end

  def self.file_exists?(file_id)
    CsvFile.exists?(id: file_id)
  end

  def self.all_user_files(user_id)
    CsvFile.where(user_id: user_id)
  end

  def self.all_user_file_ids(user_id)
    file_ids = []
    CsvFile.all_user_files(user_id).each do |file|
      file_ids << file.id
    end
    file_ids
  end

  def owner?(user_id)
    self.user_id == user_id
  end

end
