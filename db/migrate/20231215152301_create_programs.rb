class CreatePrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :programs do |t|
      t.string :program
      t.string :kode_program
      t.string :keterangan
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
