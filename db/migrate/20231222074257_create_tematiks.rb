class CreateTematiks < ActiveRecord::Migration[7.1]
  def change
    create_table :tematiks do |t|
      t.string :tematik
      t.string :keterangan
      t.references :tahun, null: false, foreign_key: true

      t.timestamps
    end
  end
end
