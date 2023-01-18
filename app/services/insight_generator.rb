# frozen_string_literal: true

module InsightGenerator

  def self.all_rows(user_id)
    CsvDatum.files_data(CsvFile.all_user_files(user_id))
  end

  def self.get_median(user_id)
    all_rows = self.all_rows(user_id)
    count = all_rows.count
    values = all_rows.order(:value).pluck(:value).to_a
    (values[(count -1)/2] + values[(count)/2])/2
  end

  def self.get_max(user_id)
    all_rows = self.all_rows(user_id)
    all_rows.maximum(:value)
  end

end
