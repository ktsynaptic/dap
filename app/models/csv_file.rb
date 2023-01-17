class CsvFile < ApplicationRecord
  def self.import(file, user_id, time)
    csvfile = self.new(filename: File.basename(file.original_filename, File.extname(file)),
                       user_id: user_id,
                       uploaded: time)
    csvfile.save!
    CsvDatum.import(file, csvfile.id)
  end
end
