class CreateLembagas < ActiveRecord::Migration[7.1]
  def change
    create_table :lembagas do |t|
      t.string :nama_lembaga
      t.string :kode_lembaga
      t.boolean :status

      t.timestamps
    end
  end
end
