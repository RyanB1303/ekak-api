class CreateTujuans < ActiveRecord::Migration[7.1]
  def change
    create_table :tujuans do |t|
      t.string :tujuan
      t.references :tujuanable, polymorphic: true

      t.timestamps
    end
  end
end
