class CreateUrusans < ActiveRecord::Migration[7.1]
  def change
    create_table :urusans do |t|
      t.string :urusan
      t.string :kode_urusan
      t.string :keterangan

      t.timestamps
    end
  end
end
