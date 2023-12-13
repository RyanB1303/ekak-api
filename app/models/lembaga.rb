# == Schema Information
#
# Table name: lembagas
#
#  id           :bigint           not null, primary key
#  kode_lembaga :string
#  nama_lembaga :string
#  status       :boolean          default(TRUE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Lembaga < ApplicationRecord
end
