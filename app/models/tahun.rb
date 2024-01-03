# == Schema Information
#
# Table name: tahuns
#
#  id                   :bigint           not null, primary key
#  keterangan           :string
#  tahun                :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  kelompok_anggaran_id :bigint
#  periode_id           :bigint           not null
#
# Indexes
#
#  index_tahuns_on_kelompok_anggaran_id  (kelompok_anggaran_id)
#  index_tahuns_on_periode_id            (periode_id)
#
# Foreign Keys
#
#  fk_rails_...  (periode_id => periodes.id)
#
class Tahun < ApplicationRecord
  belongs_to :periode
  # unique by tahun and kelompok_anggaran_id
  belongs_to :kelompok_anggaran

  validates :tahun, presence: true

  def tahun_anggaran
    "#{tahun} #{kelompok_anggaran.nama_kelompok}"
  end
end
