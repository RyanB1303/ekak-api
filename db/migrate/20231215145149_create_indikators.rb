class CreateIndikators < ActiveRecord::Migration[7.1]
  def change
    create_table :indikators do |t|
      t.string :indikator
      t.references :indikatorable, polymorphic: true
      t.string :keterangan

      t.timestamps
    end
  end
end
