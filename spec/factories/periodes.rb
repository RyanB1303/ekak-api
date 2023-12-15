# == Schema Information
#
# Table name: periodes
#
#  id           :bigint           not null, primary key
#  keterangan   :string
#  nama_periode :string
#  tahun_akhir  :integer
#  tahun_awal   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  lembaga_id   :bigint           not null
#
# Indexes
#
#  index_periodes_on_lembaga_id  (lembaga_id)
#
# Foreign Keys
#
#  fk_rails_...  (lembaga_id => lembagas.id)
#
FactoryBot.define do
  factory :periode do
    tahun_awal { 2025 }
    tahun_akhir { 2030 }
    keterangan { 'test periode' }
    nama_periode { 'Periode x-x' }
    association :lembaga
  end
end
