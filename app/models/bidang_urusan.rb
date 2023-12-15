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
class BidangUrusan < ApplicationRecord
  validates :bidang_urusan, presence: true
  validates :kode_bidang_urusan, presence: true, length: { is: 4 }
end
