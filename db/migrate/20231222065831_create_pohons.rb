class CreatePohons < ActiveRecord::Migration[7.1]
  def change
    create_table :pohons do |t|
      t.string :role
      t.references :pohonable, polymorphic: true
      t.string :keterangan
      t.integer :level, default: 0

      t.timestamps
    end
  end
end
