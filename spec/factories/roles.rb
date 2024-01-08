# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  keterangan :string
#  level      :integer          default(0)
#  role       :string
#  role_scope :integer          default("kota")
#  role_type  :integer          default("strategic")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :role do
    role { 'Strategic' }
    level { 1 }
    keterangan { 'Test Role Strategic' }
    role_scope { 1 }
    role_type { 1 }
  end
end
