# == Schema Information
#
# Table name: periodes
#
#  id           :bigint           not null, primary key
#  keterangan   :string
#  nama_periode :string
#  tahun_akhir  :integer
#  tahun_awal   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  lembaga_id   :bigint           not null
#
# Indexes
#
#  index_periodes_on_lembaga_id  (lembaga_id)
#
# Foreign Keys
#
#  fk_rails_...  (lembaga_id => lembagas.id)
#
class Periode < ApplicationRecord
  belongs_to :lembaga

  validates :tahun_awal, presence: true
  validates :tahun_akhir, presence: true
  validates :tahun_akhir, comparison: { greater_than: :tahun_awal }

  after_validation :generate_nama_periode

  def generate_nama_periode
    self.nama_periode = "Periode #{tahun_awal}-#{tahun_akhir}"
  end
end
