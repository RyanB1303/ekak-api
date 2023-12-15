# == Schema Information
#
# Table name: opds
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  kode_opd   :string           not null
#  nama_opd   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lembaga_id :bigint           not null
#
# Indexes
#
#  index_opds_on_lembaga_id  (lembaga_id)
#
# Foreign Keys
#
#  fk_rails_...  (lembaga_id => lembagas.id)
#
FactoryBot.define do
  factory :opd do
    nama_opd { 'MyString' }
    kode_opd { 'MyString' }
    active { true }
    association :lembaga
  end
end
