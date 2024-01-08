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
class RoleSerializer < ActiveModel::Serializer
  attributes :id, :role, :level, :keterangan, :role_type, :role_scope
end
