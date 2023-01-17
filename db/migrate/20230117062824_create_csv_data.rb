class CreateCsvData < ActiveRecord::Migration[7.0]
  def change
    create_table :csv_data do |t|
      t.date :date
      t.integer :value
      t.string :domain_name
      t.belongs_to :csv_file, foreign_key: true
      t.timestamps
    end

    create_table :csv_files do |t|
      t.string :filename
      t.datetime :uploaded
      t.belongs_to :user, foreign_key: true
    end
  end
end
