# == Schema Information
#
# Table name: strategics
#
#  id         :bigint           not null, primary key
#  from_kota  :boolean          default(TRUE)
#  keterangan :string
#  strategi   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  opd_id     :bigint
#  parent_id  :bigint
#  role_id    :bigint
#  tahun_id   :bigint
#
# Indexes
#
#  index_strategics_on_opd_id     (opd_id)
#  index_strategics_on_parent_id  (parent_id)
#  index_strategics_on_role_id    (role_id)
#  index_strategics_on_tahun_id   (tahun_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => strategics.id)
#
FactoryBot.define do
  factory :strategic do
    strategi { 'Strategi Kota A' }
    keterangan { 'test strategi kota' }
    from_kota { true }
    parent_id { '' }
    association :opd
    association :tahun
    association :role
  end
end
