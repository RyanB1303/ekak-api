class CreateStrategics < ActiveRecord::Migration[7.1]
  def change
    create_table :strategics do |t|
      t.string :strategi
      t.string :keterangan
      t.references :tahun, null: false, foreign_key: true
      t.string :role
      t.boolean :from_kota
      t.bigint :parent_id

      t.timestamps
    end
  end
end
