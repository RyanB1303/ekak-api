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
require 'rails_helper'

RSpec.describe KelompokAnggaran, type: :model do
  it { should belong_to :lembaga }
  it { should have_many :tahuns }
  it { should validate_presence_of :nama_kelompok }

  it '#nama_lembaga' do
    lembaga = create(:lembaga, nama_lembaga: 'Kota Madiun')
    kelompok = KelompokAnggaran.create(nama_kelompok: 'Murni',
                                       lembaga:)
    expect(kelompok.nama_lembaga).to eq 'Kota Madiun'
  end

  it 'show all tahun dalam satu kota' do
    lembaga = create(:lembaga, nama_lembaga: 'Kota Madiun')
    kelompok = KelompokAnggaran.create(nama_kelompok: 'Murni',
                                       lembaga:)
    list_tahun = (2025..2027).each do |th|
      create(:tahun, kelompok_anggaran: kelompok, tahun: th)
      create(:tahun, kelompok_anggaran: kelompok, tahun: th)
      create(:tahun, kelompok_anggaran: kelompok, tahun: th)
      create(:tahun, kelompok_anggaran: kelompok, tahun: th)
    end

    expect(kelompok.all_tahuns).to eq ['2025 Murni', '2026 Murni', '2027 Murni']
  end
end
