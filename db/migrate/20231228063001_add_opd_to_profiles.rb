class AddOpdToProfiles < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!
  def change
    add_reference_concurrently :profiles, :opd
  end
end
