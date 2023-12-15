class CreateOpds < ActiveRecord::Migration[7.1]
  def change
    create_table :opds do |t|
      t.string :nama_opd, null: false
      t.string :kode_opd, null: false
      t.boolean :active, default: true
      t.references :lembaga, null: false, foreign_key: true

      t.timestamps
    end
  end
end
