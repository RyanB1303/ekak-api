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
#  tahun_id      :bigint
#
# Indexes
#
#  index_kelompok_anggarans_on_lembaga_id  (lembaga_id)
#  index_kelompok_anggarans_on_tahun_id    (tahun_id)
#
# Foreign Keys
#
#  fk_rails_...  (lembaga_id => lembagas.id)
#
require 'rails_helper'

RSpec.describe KelompokAnggaran, type: :model do
  it { should belong_to :lembaga }
  it { should belong_to :tahun }
  it { should validate_presence_of :nama_kelompok }

  it '#tahun_anggaran' do
    tahun = create(:tahun, tahun: 2025)
    lembaga = create(:lembaga, nama_lembaga: 'Kota Madiun')
    kelompok = KelompokAnggaran.create(nama_kelompok: 'Murni',
                                       lembaga:,
                                       tahun:)
    expect(kelompok.tahun_anggaran).to eq '2025 Murni'
  end

  it '#nama_lembaga' do
    tahun = create(:tahun, tahun: 2025)
    lembaga = create(:lembaga, nama_lembaga: 'Kota Madiun')
    kelompok = KelompokAnggaran.create(nama_kelompok: 'Murni',
                                       lembaga:,
                                       tahun:)
    expect(kelompok.nama_lembaga).to eq 'Kota Madiun'
  end
end
