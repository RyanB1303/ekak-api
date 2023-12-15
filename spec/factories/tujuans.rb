# == Schema Information
#
# Table name: tujuans
#
#  id              :bigint           not null, primary key
#  tujuan          :string
#  tujuanable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  tujuanable_id   :bigint
#
# Indexes
#
#  index_tujuans_on_tujuanable  (tujuanable_type,tujuanable_id)
#
FactoryBot.define do
  factory :tujuan do
    tujuan { 'Test Tujuan' }
    tujuanable_id { 0 }
    tujuanable_type { '' }
  end
end
