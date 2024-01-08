class AddOpdToStrategics < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def up
    add_reference_concurrently :strategics, :opd
  end

  def down
    remove_reference :strategics, :opd
  end
end
