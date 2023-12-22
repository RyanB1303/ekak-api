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
#
# Indexes
#
#  index_pohons_on_parent_id  (parent_id)
#  index_pohons_on_pohonable  (pohonable_type,pohonable_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => pohons.id)
#
class Pohon < ApplicationRecord
  has_many :childs, class_name: 'Pohon',
                    foreign_key: :parent_id

  belongs_to :pohonable, polymorphic: true
  belongs_to :parent, class_name: 'Pohon', optional: true
end
