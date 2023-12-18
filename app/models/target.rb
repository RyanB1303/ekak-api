# == Schema Information
#
# Table name: targets
#
#  id              :bigint           not null, primary key
#  keterangan      :string
#  satuan          :string
#  tahun           :integer
#  target          :decimal(, )
#  targetable_type :string
#  versi           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  targetable_id   :bigint
#
# Indexes
#
#  index_targets_on_targetable  (targetable_type,targetable_id)
#
class Target < ApplicationRecord
  belongs_to :targetable, polymorphic: true

  validates :target, :satuan, :tahun, presence: true
end
