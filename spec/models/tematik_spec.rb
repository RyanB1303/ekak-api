# == Schema Information
#
# Table name: tematiks
#
#  id         :bigint           not null, primary key
#  keterangan :string
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
      childs = [Tematik.create(tematik: 'child tema 1', parent: parent, tahun: tahun),
                Tematik.create(tematik: 'child tema 2', parent: parent, tahun: tahun)]

      expect(parent.childs).to eq(childs)
    end

    it 'can nest parent-childs' do
      parent = create(:tematik, tahun: tahun)
      child1 = Tematik.create(tematik: 'child level 1', parent: parent, tahun: tahun)
      child2 = Tematik.create(tematik: 'child level 2', parent: child1, tahun: tahun)

      expect(parent.childs).to include(child1)
      expect(child1.childs).to include(child2)
    end
  end
end
