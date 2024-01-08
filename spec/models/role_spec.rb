# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  keterangan :string
#  level      :integer          default(0)
#  role       :string
#  role_scope :integer          default("kota")
#  role_type  :integer          default("strategic")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:level) }

  context 'role on strategic' do
    it 'show strategic role' do
      role = Role.create(role: 'Strategic-Kota',
                         level: 1,
                         keterangan: 'strategic kota',
                         role_scope: 1,
                         role_type: 1)
      strategic = create(:strategic, role:)

      expect(strategic.role).to eq role
    end
  end
end
