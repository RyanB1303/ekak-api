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
#  tahun_id       :bigint
#
# Indexes
#
#  index_pohons_on_parent_id  (parent_id)
#  index_pohons_on_pohonable  (pohonable_type,pohonable_id)
#  index_pohons_on_tahun_id   (tahun_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => pohons.id)
#
require 'rails_helper'

RSpec.describe Pohon, type: :model do
  it { should belong_to :tahun }
  it { should belong_to :pohonable }

  context 'parent child pohon' do
    let(:tematik) { create(:tematik) }
    let(:sub_tematik) { create(:tematik, parent: tematik) }

    it 'should create childs self referential' do
      pohon_parent = Pohon.create(pohonable_type: 'Tematik',
                                  pohonable_id: tematik.id,
                                  tahun: tematik.tahun,
                                  role: 'tematik-kota')
      pohon_childs = [Pohon.create(pohonable_type: 'Tematik',
                                   pohonable_id: sub_tematik.id,
                                   role: 'subtematik-kota',
                                   tahun: sub_tematik.tahun,
                                   parent: pohon_parent),
                      Pohon.create(pohonable_type: 'Tematik',
                                   pohonable_id: sub_tematik.id,
                                   tahun: sub_tematik.tahun,
                                   role: 'subtematik-kota',
                                   parent: pohon_parent)]

      expect(pohon_parent.childs).to eq(pohon_childs)
    end
  end

  context 'auto generate level of pohon' do
    # TODO: mock pohonable
    let(:tematik) { create(:tematik) }

    it 'auto generate level of childs' do
      pohon = Pohon.create(pohonable_type: 'Tematik',
                           tahun: tematik.tahun,
                           pohonable_id: tematik.id)

      sub_tema = Tematik.create(tematik: 'subtematik', tahun: tematik.tahun, parent: tematik)
      pohon_childs = Pohon.create(pohonable_type: 'Tematik',
                                  pohonable_id: sub_tema.id,
                                  tahun: sub_tema.tahun,
                                  parent: pohon)

      expect(pohon.level).to eq(0)
      expect(pohon_childs.level).to eq(1)
    end
  end

  context 'auto generate role pohon' do
    let(:tematik) { create(:tematik) }
    it 'generate role by level and opd id' do
      pohon = Pohon.create(pohonable_type: 'Tematik',
                           tahun: tematik.tahun,
                           pohonable_id: tematik.id)

      pending
      expect(pohon.role).to eq('pohon-kota-level-0')
    end
  end
end
