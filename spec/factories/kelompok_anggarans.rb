# == Schema Information
#
# Table name: kelompok_anggarans
#
#  id            :bigint           not null, primary key
#  keterangan    :string
#  nama_kelompok :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  lembaga_id    :bigint           not null
#  tahun_id      :bigint
#
# Indexes
#
#  index_kelompok_anggarans_on_lembaga_id  (lembaga_id)
#  index_kelompok_anggarans_on_tahun_id    (tahun_id)
#
# Foreign Keys
#
#  fk_rails_...  (lembaga_id => lembagas.id)
#
FactoryBot.define do
  factory :kelompok_anggaran do
    nama_kelompok { "MyString" }
    keterangan { "MyString" }
    lembaga { nil }
  end
end
