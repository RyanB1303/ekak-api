# == Schema Information
#
# Table name: tahuns
#
#  id                   :bigint           not null, primary key
#  keterangan           :string
#  tahun                :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  kelompok_anggaran_id :bigint
#  periode_id           :bigint           not null
#
# Indexes
#
#  index_tahuns_on_kelompok_anggaran_id  (kelompok_anggaran_id)
#  index_tahuns_on_periode_id            (periode_id)
#
# Foreign Keys
#
#  fk_rails_...  (periode_id => periodes.id)
#
FactoryBot.define do
  factory :tahun do
    tahun { 2025 }
    keterangan { '-' }
    association :periode
    association :kelompok_anggaran
  end
end
