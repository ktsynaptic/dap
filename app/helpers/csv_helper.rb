module CsvHelper
  def self.create_template
    CSV.generate(headers: true) do |csv|
      csv << Format::HEADERS
    end
  end
end
