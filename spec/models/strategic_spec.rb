# == Schema Information
#
# Table name: strategics
#
#  id         :bigint           not null, primary key
#  from_kota  :boolean          default(TRUE)
#  keterangan :string
#  strategi   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  opd_id     :bigint
#  parent_id  :bigint
#  role_id    :bigint
#  tahun_id   :bigint
#
# Indexes
#
#  index_strategics_on_opd_id     (opd_id)
#  index_strategics_on_parent_id  (parent_id)
#  index_strategics_on_role_id    (role_id)
#  index_strategics_on_tahun_id   (tahun_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => strategics.id)
#
require 'rails_helper'

RSpec.describe Strategic, type: :model do
  it { should belong_to :tahun }
  it { should belong_to :opd }
  it { should belong_to(:parent).optional }
  it { should validate_presence_of :strategi }

  context 'parent child strategi' do
    it 'have one parent' do
      tahun = create(:tahun, tahun: 2025)
      opd = create(:opd)
      role = create(:role)
      role_tactical = create(:role, role: 'Tactical', level: 2)
      strategi_parent = Strategic.create(strategi: 'contoh strategi',
                                         tahun:,
                                         opd:,
                                         role:)
      strategi_childs = Strategic.create(strategi: 'child 1',
                                         tahun:,
                                         opd:,
                                         role: role_tactical,
                                         parent: strategi_parent)

      expect(strategi_childs.parent).to eq(strategi_parent)
    end
    it 'have childs' do
      tahun = create(:tahun, tahun: 2025)
      opd = create(:opd)
      role = create(:role)
      role_tactical = create(:role, role: 'Tactical', level: 2)
      strategi_parent = Strategic.create(strategi: 'contoh strategi',
                                         tahun:,
                                         opd:,
                                         role:)
      tactical_childs = [Strategic.create(strategi: 'child 1',
                                          tahun:,
                                          opd:,
                                          role: role_tactical,
                                          parent: strategi_parent),
                         Strategic.create(strategi: 'child 2',
                                          tahun:,
                                          opd:,
                                          role: role_tactical,
                                          parent: strategi_parent)]

      expect(strategi_parent.childs).to eq(tactical_childs)
    end
  end
end
