# == Schema Information
#
# Table name: pohons
#
#  id             :bigint           not null, primary key
#  keterangan     :string
#  level          :integer          default(0)
#  pohonable_type :string
#  role           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pohonable_id   :bigint
#
# Indexes
#
#  index_pohons_on_pohonable  (pohonable_type,pohonable_id)
#
require 'rails_helper'

RSpec.describe Pohon, type: :model do
  it { should belong_to :pohonable }

  it 'should create pohon tematik with level 0' do
    tematik = create(:tematik, tahun: 2025)
    pohon = Pohon.create(keterangan: 'Test Pohon',
                         pohonable_id: tematik.id,
                         pohonable_type: 'Tematik')
  end
end
