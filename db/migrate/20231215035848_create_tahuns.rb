class CreateTahuns < ActiveRecord::Migration[7.1]
  def change
    create_table :tahuns do |t|
      t.integer :tahun
      t.string :kelompok_anggaran
      t.string :keterangan
      t.references :periode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
