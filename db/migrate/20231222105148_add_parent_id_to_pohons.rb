class AddParentIdToPohons < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def change
    add_reference_concurrently :pohons, :parent, foreign_key: { to_table: :pohons }
  end
end
