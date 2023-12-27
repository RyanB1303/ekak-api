class AddJenisLevelToTematiks < ActiveRecord::Migration[7.1]
  def change
    add_column :tematiks, :jenis, :string, null: true
    add_column :tematiks, :level, :integer, default: 0
  end
end
