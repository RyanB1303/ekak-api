# == Schema Information
#
# Table name: pohons
#
#  id             :bigint           not null, primary key
#  keterangan     :string
#  level          :integer          default(0)
#  pohonable_type :string
#  role           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pohonable_id   :bigint
#
# Indexes
#
#  index_pohons_on_pohonable  (pohonable_type,pohonable_id)
#
FactoryBot.define do
  factory :pohon do
    pohonable_type { '' }
    pohonable_id { 1 }
    role { 'MyString' }
    keterangan { 'MyString' }
  end
end
