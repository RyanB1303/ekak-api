# == Schema Information
#
# Table name: kelompok_anggarans
#
#  id            :bigint           not null, primary key
#  keterangan    :string
#  nama_kelompok :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  lembaga_id    :bigint           not null
#
# Indexes
#
#  index_kelompok_anggarans_on_lembaga_id  (lembaga_id)
#
# Foreign Keys
#
#  fk_rails_...  (lembaga_id => lembagas.id)
#
class KelompokAnggaran < ApplicationRecord
  belongs_to :lembaga
  has_many :tahuns

  validates :nama_kelompok, presence: true

  def nama_lembaga
    lembaga.nama_lembaga
  end

  def all_tahuns
    ['2025 Murni', '2026 Murni', '2027 Murni']
  end
end
