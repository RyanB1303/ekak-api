class AddParentIdInTematiks < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!
  def change
    add_reference_concurrently :tematiks, :parent, foreign_key: { to_table: :tematiks }
  end
end
