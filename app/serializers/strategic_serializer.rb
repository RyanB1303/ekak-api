# == Schema Information
#
# Table name: strategics
#
#  id         :bigint           not null, primary key
#  from_kota  :boolean          default(TRUE)
#  keterangan :string
#  strategi   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  opd_id     :bigint
#  parent_id  :bigint
#  role_id    :bigint
#  tahun_id   :bigint
#
# Indexes
#
#  index_strategics_on_opd_id     (opd_id)
#  index_strategics_on_parent_id  (parent_id)
#  index_strategics_on_role_id    (role_id)
#  index_strategics_on_tahun_id   (tahun_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => strategics.id)
#
class StrategicSerializer < ActiveModel::Serializer
  attributes :id, :strategi, :keterangan, :from_kota, :parent_id
  has_one :tahun
  has_one :opd
end
