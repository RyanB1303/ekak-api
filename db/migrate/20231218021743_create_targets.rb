class CreateTargets < ActiveRecord::Migration[7.1]
  def change
    create_table :targets do |t|
      t.decimal :target
      t.string :satuan
      t.integer :tahun
      t.string :versi
      t.string :keterangan
      t.references :targetable, polymorphic: true

      t.timestamps
    end
  end
end
