# == Schema Information
#
# Table name: tahuns
#
#  id                :bigint           not null, primary key
#  kelompok_anggaran :string
#  keterangan        :string
#  tahun             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  periode_id        :bigint           not null
#
# Indexes
#
#  index_tahuns_on_periode_id  (periode_id)
#
# Foreign Keys
#
#  fk_rails_...  (periode_id => periodes.id)
#
class Tahun < ApplicationRecord
  belongs_to :periode
  # unique by tahun and kelompok_anggaran_id
  has_many :kelompok_anggarans

  validates :tahun, presence: true
end
