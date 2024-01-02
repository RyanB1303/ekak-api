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
class Pohon < ApplicationRecord
  belongs_to :tahun
  belongs_to :parent, class_name: 'Pohon', optional: true

  has_many :childs, class_name: 'Pohon',
                    primary_key: :id,
                    foreign_key: :parent_id

  belongs_to :pohonable, polymorphic: true
  belongs_to :parent, class_name: 'Pohon', optional: true

  # if pohon validation pass
  after_validation :generate_level

  def generate_level
    self.level = if parent_id.blank?
                   0
                 else
                   parent.level + 1
                 end
  end
end
