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
require 'rails_helper'

RSpec.describe Periode, type: :model do
  it { should belong_to :lembaga }
  it { should validate_presence_of :tahun_awal }
  it { should validate_presence_of :tahun_akhir }

  it 'should invalid when tahun_akhir < tahun_awal' do
    lembaga = create(:lembaga)
    periode = Periode.new
    periode.tahun_awal = 2019
    periode.tahun_akhir = 2010
    periode.lembaga = lembaga
    periode.validate
    expect(periode.errors[:tahun_akhir]).to eq(['must be greater than 2019'])
  end

  it 'should add nama_periode after create or update' do
    lembaga = create(:lembaga)
    periode = Periode.new
    periode.tahun_awal = 2020
    periode.tahun_akhir = 2024
    periode.lembaga = lembaga
    periode.validate
    expect(periode.nama_periode).to eq('Periode 2020-2024')
  end
end
