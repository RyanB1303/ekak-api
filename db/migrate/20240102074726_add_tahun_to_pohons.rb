class AddTahunToPohons < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!
  def change
    add_reference_concurrently :pohons, :tahun
  end
end
