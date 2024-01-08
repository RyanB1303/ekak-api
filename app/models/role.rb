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
class Role < ApplicationRecord
  enum :role_scope, { kota: 1, opd: 2 }
  enum :role_type, { strategic: 1, pohon: 2 }

  validates :role, presence: true
  validates :level, presence: true
end
