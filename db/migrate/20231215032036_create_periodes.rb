class CreatePeriodes < ActiveRecord::Migration[7.1]
  def change
    create_table :periodes do |t|
      t.string :nama_periode
      t.integer :tahun_awal
      t.integer :tahun_akhir
      t.string :keterangan
      t.references :lembaga, null: false, foreign_key: true

      t.timestamps
    end
  end
end
