# == Schema Information
#
# Table name: anggarans
#
#  id                :bigint           not null, primary key
#  anggaranable_type :string
#  keterangan        :string
#  kode              :string
#  tahun             :integer
#  total             :decimal(, )      default(0.0)
#  uraian            :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  anggaranable_id   :bigint
#
# Indexes
#
#  index_anggarans_on_anggaranable  (anggaranable_type,anggaranable_id)
#
FactoryBot.define do
  factory :anggaran do
    kode { '11.22.33' }
    uraian { 'Anggaran X' }
    total { '9.99' }
    tahun { 2025 }
    keterangan { 'anggaran keterangan' }
    anggaranable_id { nil }
    anggaranable_type { '' }
  end
end
