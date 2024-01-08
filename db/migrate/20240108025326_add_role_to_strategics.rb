class AddRoleToStrategics < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def up
    add_reference_concurrently :strategics, :role
  end

  def down
    remove_reference :strategics, :role
  end
end
