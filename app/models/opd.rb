# == Schema Information
#
# Table name: opds
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  kode_opd   :string           not null
#  nama_opd   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lembaga_id :bigint           not null
#
# Indexes
#
#  index_opds_on_lembaga_id  (lembaga_id)
#
# Foreign Keys
#
#  fk_rails_...  (lembaga_id => lembagas.id)
#
class Opd < ApplicationRecord
  belongs_to :lembaga
  has_many :tujuans, as: :tujuanable

  validates :nama_opd, presence: true
  validates :kode_opd, presence: true
end
