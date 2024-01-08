class AddTahunToStrategics < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def up
    add_reference_concurrently :strategics, :tahun
  end

  def down
    remove_reference :strategics, :tahun
  end
end
