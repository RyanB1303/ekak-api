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
require 'rails_helper'

RSpec.describe Tahun, type: :model do
  it { should belong_to :periode }
  it { should belong_to :kelompok_anggaran }
  it { should validate_presence_of :tahun }

  context '#tahun_anggaran' do
    it 'show tahun and kelompok' do
      kelompok_murni = create(:kelompok_anggaran, nama_kelompok: 'Murni')
      tahun = Tahun.create(tahun: 2025, kelompok_anggaran: kelompok_murni)
      expect(tahun.tahun_anggaran).to eq '2025 Murni'
    end
  end

  it 'testing the factories' do
    kelompok_murni = create(:kelompok_anggaran, nama_kelompok: 'Murni')
    tahun = create(:tahun, tahun: 2025, kelompok_anggaran: kelompok_murni)
    expect(tahun.tahun_anggaran).to eq '2025 Murni'
  end
end
