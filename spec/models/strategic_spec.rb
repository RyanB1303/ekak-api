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
#  tahun_id   :bigint
#
# Indexes
#
#  index_strategics_on_opd_id     (opd_id)
#  index_strategics_on_parent_id  (parent_id)
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

  xcontext 'parent child strategi' do
    it 'have one parent' do
      tahun = create(:tahun, tahun: 2025)
      opd = create(:opd)
      strategi_parent = Strategic.create(strategi: 'contoh strategi',
                                         tahun:,
                                         opd:,
                                         role: 'Strategic')
      strategi_childs = Strategic.create(strategi: 'child 1',
                                         tahun:,
                                         opd:,
                                         role: 'Tactical',
                                         parent_id: strategi_parent)

      expect(strategi_childs.parent).to eq(strategi_parent)
    end
  end
end
