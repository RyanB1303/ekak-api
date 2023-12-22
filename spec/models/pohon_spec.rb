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
#  parent_id      :bigint
#  pohonable_id   :bigint
#
# Indexes
#
#  index_pohons_on_parent_id  (parent_id)
#  index_pohons_on_pohonable  (pohonable_type,pohonable_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => pohons.id)
#
require 'rails_helper'

RSpec.describe Pohon, type: :model do
  it { should belong_to :pohonable }

  it 'should create pohon tematik with level 0' do
    tematik = create(:tematik)
    pohon = Pohon.create(keterangan: 'Test Pohon',
                         pohonable_id: tematik.id,
                         pohonable_type: 'Tematik')
  end

  it 'should create nested pohon' do
   tematik = create(:tematik)
   second_tematik = create(:tematik)
   pohon_top = Pohon.create(pohonable_type: 'Tematik',
                            pohonable_id: tematik.id,
                            role: 'tematik-kota'
                           )
   pohon_bottom = Pohon.create(pohonable_type: 'Tematik',
                            pohonable_id: second_tematik.id,
                            role: 'tematik-kota',
                            parent_id: pohon_top.id
                           )

   expect(pohon_top.childs).to include(pohon_bottom)
   expect(pohon_bottom.parent).to eq(pohon_top)
  end
end
