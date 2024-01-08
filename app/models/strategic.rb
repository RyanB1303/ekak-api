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
class Strategic < ApplicationRecord
  belongs_to :tahun
  belongs_to :opd
  belongs_to :role
  belongs_to :parent, class_name: 'Strategic', optional: true

  has_many :childs, class_name: 'Strategic',
                    primary_key: :id,
                    foreign_key: :parent_id

  validates :strategi, presence: true
end
