# == Schema Information
#
# Table name: targets
#
#  id              :bigint           not null, primary key
#  keterangan      :string
#  satuan          :string
#  tahun           :integer
#  target          :decimal(, )
#  targetable_type :string
#  versi           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  targetable_id   :bigint
#
# Indexes
#
#  index_targets_on_targetable  (targetable_type,targetable_id)
#
require 'rails_helper'

RSpec.describe Target, type: :model do
  it { should belong_to :targetable }
  it { should validate_presence_of :target }
  it { should validate_presence_of :satuan }
  it { should validate_presence_of :tahun }
end
