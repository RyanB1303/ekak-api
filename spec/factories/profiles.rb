# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  aktif      :boolean          default(TRUE)
#  nama       :string           not null
#  nip        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  opd_id     :bigint           not null
#
# Indexes
#
#  index_profiles_on_opd_id  (opd_id)
#
# Foreign Keys
#
#  fk_rails_...  (opd_id => opds.id)
#
FactoryBot.define do
  factory :profile do
    nama { "MyString" }
    nip { "MyString" }
    opd { nil }
    status { false }
  end
end
