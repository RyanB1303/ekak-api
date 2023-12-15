# == Schema Information
#
# Table name: tujuans
#
#  id              :bigint           not null, primary key
#  tujuan          :string
#  tujuanable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  tujuanable_id   :bigint
#
# Indexes
#
#  index_tujuans_on_tujuanable  (tujuanable_type,tujuanable_id)
#
require 'rails_helper'

RSpec.describe Tujuan, type: :model do
  it { should belong_to :tujuanable }
  it { should have_many :indikators }
  it { should validate_presence_of :tujuan }
  it { should validate_length_of(:tujuan).is_at_least(10) }
end
