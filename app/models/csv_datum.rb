require 'csv'

class CsvDatum < ApplicationRecord
  def self.import(file, file_id)
    CSV.foreach(file.path, headers: true) do |row|
      data = self.new
      data.date = row["date"]
      data.value = row["value"]
      data.domain_name = row["domain_name"]
      data.csv_file_id = file_id
      data.save!
    end
  end
end

