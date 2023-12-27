# == Schema Information
#
# Table name: tematiks
#
#  id         :bigint           not null, primary key
#  keterangan :string
#  tematik    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :bigint
#  tahun_id   :bigint           not null
#
# Indexes
#
#  index_tematiks_on_parent_id  (parent_id)
#  index_tematiks_on_tahun_id   (tahun_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => tematiks.id)
#  fk_rails_...  (tahun_id => tahuns.id)
#
FactoryBot.define do
  factory :tematik do
    tematik { 'Tematik' }
    keterangan { 'Keterangan x' }
    association :tahun
  end
end
