class CreateKelompokAnggarans < ActiveRecord::Migration[7.1]
  def change
    create_table :kelompok_anggarans do |t|
      t.string :nama_kelompok
      t.string :keterangan
      t.references :lembaga, null: false, foreign_key: true

      t.timestamps
    end
  end
end
