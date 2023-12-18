class CreateAnggarans < ActiveRecord::Migration[7.1]
  def change
    create_table :anggarans do |t|
      t.string :kode
      t.text :uraian
      t.decimal :total, default: 0
      t.integer :tahun
      t.string :keterangan
      t.references :anggaranable, polymorphic: true

      t.timestamps
    end
  end
end
