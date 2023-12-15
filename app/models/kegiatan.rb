# == Schema Information
#
# Table name: kegiatans
#
#  id            :bigint           not null, primary key
#  active        :boolean          default(TRUE)
#  kegiatan      :string
#  keterangan    :string
#  kode_kegiatan :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Kegiatan < ApplicationRecord
  validates :kegiatan, presence: true
  validates :kode_kegiatan, presence: true, length: { is: 12 }
end
