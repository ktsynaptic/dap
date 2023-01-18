require 'csv'

class CsvDatum < ApplicationRecord
  def self.import(file, file_id)
    CSV.foreach(file.path, headers: true) do |row|
      data = self.new
      data.date = row[Format::DATE]
      data.value = row[Format::VALUE]
      data.domain_name = row[Format::DOMAIN]
      data.csv_file_id = file_id
      data.save!
    end
  end

  def self.file_data(file_id)
    CsvDatum.where(csv_file_id: file_id)
  end

  def self.files_data(file_ids)
    CsvDatum.where(csv_file_id: file_ids)
  end
end

