# == Schema Information
#
# Table name: programs
#
#  id           :bigint           not null, primary key
#  active       :boolean          default(TRUE)
#  keterangan   :string
#  kode_program :string
#  program      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :program do
    program { "MyString" }
    kode_program { "MyString" }
    keterangan { "MyString" }
    active { false }
  end
end
