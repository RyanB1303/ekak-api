# == Schema Information
#
# Table name: strategics
#
#  id         :bigint           not null, primary key
#  from_kota  :boolean
#  keterangan :string
#  role       :string
#  strategi   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  opd_id     :bigint
#  parent_id  :bigint
#  tahun_id   :bigint           not null
#
# Indexes
#
#  index_strategics_on_opd_id    (opd_id)
#  index_strategics_on_tahun_id  (tahun_id)
#
# Foreign Keys
#
#  fk_rails_...  (tahun_id => tahuns.id)
#
FactoryBot.define do
  factory :strategic do
    strategi { "MyString" }
    keterangan { "MyString" }
    tahun { nil }
    role { "MyString" }
    opd { nil }
    from_kota { false }
    parent_id { "" }
  end
end
