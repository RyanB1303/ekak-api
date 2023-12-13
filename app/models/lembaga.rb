# == Schema Information
#
# Table name: lembagas
#
#  id           :bigint           not null, primary key
#  active       :boolean          default(TRUE)
#  kode_lembaga :string
#  nama_lembaga :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Lembaga < ApplicationRecord
  validates :nama_lembaga, presence: true
end
