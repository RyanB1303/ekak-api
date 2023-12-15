# == Schema Information
#
# Table name: urusans
#
#  id          :bigint           not null, primary key
#  keterangan  :string
#  kode_urusan :string
#  urusan      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :urusan do
    urusan { "MyString" }
    kode_urusan { "MyString" }
    keterangan { "MyString" }
  end
end
