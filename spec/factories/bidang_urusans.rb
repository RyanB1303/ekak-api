# == Schema Information
#
# Table name: bidang_urusans
#
#  id                 :bigint           not null, primary key
#  bidang_urusan      :string
#  keterangan         :string
#  kode_bidang_urusan :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
FactoryBot.define do
  factory :bidang_urusan do
    bidang_urusan { "MyString" }
    kode_bidang_urusan { "MyString" }
    keterangan { "MyString" }
  end
end
