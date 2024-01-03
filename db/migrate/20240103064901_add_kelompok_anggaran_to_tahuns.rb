class AddKelompokAnggaranToTahuns < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def up
    add_reference_concurrently :tahuns, :kelompok_anggaran
  end

  def down
    remove_reference :tahuns, :kelompok_anggaran
  end
end
