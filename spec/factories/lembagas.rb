# == Schema Information
#
# Table name: lembagas
#
#  id           :bigint           not null, primary key
#  active       :boolean          default(TRUE)
#  kode_lembaga :string
#  nama_lembaga :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :lembaga do
    nama_lembaga { 'Kota A' }
    kode_lembaga { 'xxx' }
    active { true }
  end
end
