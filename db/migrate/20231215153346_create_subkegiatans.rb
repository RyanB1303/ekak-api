class CreateSubkegiatans < ActiveRecord::Migration[7.1]
  def change
    create_table :subkegiatans do |t|
      t.string :subkegiatan
      t.string :kode_subkegiatan
      t.string :keterangan
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
