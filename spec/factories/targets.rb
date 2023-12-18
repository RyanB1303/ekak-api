# == Schema Information
#
# Table name: targets
#
#  id              :bigint           not null, primary key
#  keterangan      :string
#  satuan          :string
#  tahun           :integer
#  target          :decimal(, )
#  targetable_type :string
#  versi           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  targetable_id   :bigint
#
# Indexes
#
#  index_targets_on_targetable  (targetable_type,targetable_id)
#
FactoryBot.define do
  factory :target do
    target { '9.99' }
    satuan { '%' }
    tahun { 2025 }
    versi { 'murni' }
    keterangan { 'target keterangan' }
    targetable_id { 1 }
    targetable_type { '' }
  end
end
