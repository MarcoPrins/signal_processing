class CreateDataCaptures < ActiveRecord::Migration[5.2]
  def change
    create_table :data_captures do |t|
      t.string :title,   null: false
      t.text   :data,    null: false

      t.timestamps
    end
  end
end
