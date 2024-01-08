class CreateStrategics < ActiveRecord::Migration[7.1]
  def change
    create_table :strategics do |t|
      t.string :strategi
      t.string :keterangan
      t.boolean :from_kota, default: true
      t.references :parent, null: true, foreign_key: { to_table: :strategics }

      t.timestamps
    end
  end
end
