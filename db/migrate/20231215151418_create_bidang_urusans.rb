class CreateBidangUrusans < ActiveRecord::Migration[7.1]
  def change
    create_table :bidang_urusans do |t|
      t.string :bidang_urusan
      t.string :kode_bidang_urusan
      t.string :keterangan

      t.timestamps
    end
  end
end
