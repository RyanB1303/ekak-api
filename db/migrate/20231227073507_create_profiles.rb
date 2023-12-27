class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :nama, null: false
      t.string :nip, null: false
      t.references :opd, null: false, foreign_key: true
      t.boolean :aktif, default: true

      t.timestamps
    end
  end
end
