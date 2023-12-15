# == Schema Information
#
# Table name: programs
#
#  id           :bigint           not null, primary key
#  active       :boolean          default(TRUE)
#  keterangan   :string
#  kode_program :string
#  program      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Program < ApplicationRecord
  validates :program, presence: true
  validates :kode_program, presence: true, length: { is: 7 }
end
