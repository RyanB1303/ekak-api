# == Schema Information
#
# Table name: tematiks
#
#  id         :bigint           not null, primary key
#  jenis      :string
#  keterangan :string
#  level      :integer          default(0)
#  tematik    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :bigint
#  tahun_id   :bigint           not null
#
# Indexes
#
#  index_tematiks_on_parent_id  (parent_id)
#  index_tematiks_on_tahun_id   (tahun_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => tematiks.id)
#  fk_rails_...  (tahun_id => tahuns.id)
#
class Tematik < ApplicationRecord
  belongs_to :tahun
  belongs_to :parent, class_name: 'Tematik', optional: true
  has_many :pohons, as: :pohonable
  has_many :childs, class_name: 'Tematik', primary_key: :id, foreign_key: :parent_id

  validates_presence_of :tematik
  validates_length_of :tematik, minimum: 5
end
