# frozen_string_literal: true

module AccessValidator
  # 0 IF file not exists, -1 if access is denied, 1 if access is granted
  def self.check_file_access(file_id, user_id)
    return 0 unless CsvFile.file_exists?(file_id)
    if CsvFile.get_file(file_id).owner?(user_id)
      return 1
    end
    return -1
  end
end
