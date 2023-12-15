# == Schema Information
#
# Table name: indikators
#
#  id                 :bigint           not null, primary key
#  indikator          :string
#  indikatorable_type :string
#  keterangan         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  indikatorable_id   :bigint
#
# Indexes
#
#  index_indikators_on_indikatorable  (indikatorable_type,indikatorable_id)
#
FactoryBot.define do
  factory :indikator do
    indikator { 'Indikator' }
    indikatorable_type { '' }
    indikatorable_id { 0 }
    keterangan { 'Contoh Indikator' }
  end
end
