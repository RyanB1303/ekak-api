# == Schema Information
#
# Table name: kegiatans
#
#  id            :bigint           not null, primary key
#  active        :boolean          default(TRUE)
#  kegiatan      :string
#  keterangan    :string
#  kode_kegiatan :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :kegiatan do
    kegiatan { "MyString" }
    kode_kegiatan { "MyString" }
    keterangan { "MyString" }
    active { false }
  end
end
