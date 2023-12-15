# == Schema Information
#
# Table name: subkegiatans
#
#  id               :bigint           not null, primary key
#  active           :boolean          default(TRUE)
#  keterangan       :string
#  kode_subkegiatan :string
#  subkegiatan      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
FactoryBot.define do
  factory :subkegiatan do
    subkegiatan { "MyString" }
    kode_subkegiatan { "MyString" }
    keterangan { "MyString" }
    active { false }
  end
end
