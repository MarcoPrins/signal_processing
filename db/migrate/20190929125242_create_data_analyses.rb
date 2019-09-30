class CreateDataAnalyses < ActiveRecord::Migration[5.2]
  def change
    create_table :data_analyses do |t|
      t.string  :type,            null: false
      t.integer :data_capture_id, null: false
      t.text    :data,            null: false
      t.integer :threshold

      t.timestamps
    end
  end
end
