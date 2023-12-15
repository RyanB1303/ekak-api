# == Schema Information
#
# Table name: subkegiatans
#
#  id               :bigint           not null, primary key
#  active           :boolean          default(TRUE)
#  keterangan       :string
#  kode_subkegiatan :string
#  subkegiatan      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Subkegiatan < ApplicationRecord
  validates :subkegiatan, presence: true
  validates :kode_subkegiatan, presence: true, length: { is: 17 }
end
