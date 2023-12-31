# == Schema Information
#
# Table name: tematiks
#
#  id         :bigint           not null, primary key
#  jenis      :string
#  keterangan :string
#  level      :integer          default(0)
#  tematik    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :bigint
#  tahun_id   :bigint           not null
#
# Indexes
#
#  index_tematiks_on_parent_id  (parent_id)
#  index_tematiks_on_tahun_id   (tahun_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => tematiks.id)
#  fk_rails_...  (tahun_id => tahuns.id)
#
require 'rails_helper'

RSpec.describe Tematik, type: :model do
  it { should belong_to :tahun }
  it { should belong_to(:parent).optional }
  it { should have_many :pohons }
  it { should have_many :childs }
  it { should validate_presence_of :tematik }
  it { should validate_length_of(:tematik).is_at_least(5) }

  context 'parent-child example' do
    let(:tahun) { create(:tahun, tahun: 2025) }
    it 'should list all childs' do
      parent = create(:tematik, tahun: tahun)
      childs = [Tematik.create(tematik: 'child tema 1', parent: parent, tahun: tahun, level: 1, jenis: 'SubTematik'),
                Tematik.create(tematik: 'child tema 2', parent: parent, tahun: tahun, level: 1, jenis: 'SubSubTematik')]

      expect(parent.childs).to eq(childs)
    end

    it 'can nest parent-childs' do
      parent = create(:tematik, tahun: tahun)
      child1 = Tematik.create(tematik: 'child level 1', parent: parent, tahun: tahun, level: 1, jenis: 'SubTematik')
      child2 = Tematik.create(tematik: 'child level 2', parent: child1, tahun: tahun, level: 2, jenis: 'SubSubTematik')

      expect(parent.childs).to include(child1)
      expect(child1.childs).to include(child2)
    end
  end

  context 'auto generate jenis and level' do
    let(:tahun) { create(:tahun, tahun: 2025) }
    it 'should generate level for each childs' do
      parent = create(:tematik, tahun: tahun)
      child1 = Tematik.create(tematik: 'child level 1', parent: parent, tahun: tahun)
      child2 = Tematik.create(tematik: 'child level 2', parent: child1, tahun: tahun)
      expect(child1.level).to eq(1)
      expect(child2.level).to eq(2)
    end
    it 'should generate jenis for each childs' do
      # level | jenis
      # 0   => 'Tematik'
      # 1   => 'SubTematik'
      # 2   => 'SubSubTematik'
      parent = create(:tematik, tahun: tahun)
      child1 = Tematik.create(tematik: 'SubTematik 1', parent: parent, tahun: tahun)
      child2 = Tematik.create(tematik: 'SubSubTematik 1', parent: child1, tahun: tahun)
      expect(parent.jenis).to eq('Tematik')
      expect(child1.jenis).to eq('SubTematik')
      expect(child2.jenis).to eq('SubSubTematik')
    end
  end
end
