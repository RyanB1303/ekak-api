class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :nama, null: false
      t.references :user, null: false, foreign_key: true
      t.boolean :aktif, default: true

      t.timestamps
    end
  end
end
