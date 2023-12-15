# == Schema Information
#
# Table name: urusans
#
#  id          :bigint           not null, primary key
#  keterangan  :string
#  kode_urusan :string
#  urusan      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Urusan < ApplicationRecord
  validates :urusan, presence: true
  validates :kode_urusan, presence: true, length: { is: 1 }
end
