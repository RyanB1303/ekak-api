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
#  parent_id      :bigint
#  pohonable_id   :bigint
#  tahun_id       :bigint
#
# Indexes
#
#  index_pohons_on_parent_id  (parent_id)
#  index_pohons_on_pohonable  (pohonable_type,pohonable_id)
#  index_pohons_on_tahun_id   (tahun_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => pohons.id)
#
FactoryBot.define do
  factory :pohon do
    pohonable_type { '' }
    pohonable_id { 1 }
    role { 'MyString' }
    keterangan { 'MyString' }
    tahun_id { 1 }
  end
end
