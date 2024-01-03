class RemoveKelompokAnggaranFromTahuns < ActiveRecord::Migration[7.1]
  def change
    safety_assured { remove_column :tahuns, :kelompok_anggaran }
  end
end
