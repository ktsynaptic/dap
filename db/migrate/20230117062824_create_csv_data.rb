class CreateCsvData < ActiveRecord::Migration[7.0]
  def change
    create_table :csv_data do |t|

      t.timestamps
    end
  end
end
