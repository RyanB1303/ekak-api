# == Schema Information
#
# Table name: bidang_urusans
#
#  id                 :bigint           not null, primary key
#  bidang_urusan      :string
#  keterangan         :string
#  kode_bidang_urusan :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'rails_helper'

RSpec.describe BidangUrusan, type: :model do
  it { should validate_presence_of :bidang_urusan }
  it { should validate_presence_of :kode_bidang_urusan }
  it { should validate_length_of(:kode_bidang_urusan).is_equal_to(4) }
end
