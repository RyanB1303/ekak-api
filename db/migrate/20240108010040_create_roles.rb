class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.string :role
      t.integer :role_scope, default: 1
      t.integer :role_type, default: 1
      t.integer :level, default: 0
      t.string :keterangan

      t.timestamps
    end
  end
end
