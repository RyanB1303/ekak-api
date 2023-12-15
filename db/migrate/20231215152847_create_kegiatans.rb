class CreateKegiatans < ActiveRecord::Migration[7.1]
  def change
    create_table :kegiatans do |t|
      t.string :kegiatan
      t.string :kode_kegiatan
      t.string :keterangan
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
