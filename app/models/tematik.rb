# == Schema Information
#
# Table name: tematiks
#
#  id         :bigint           not null, primary key
#  keterangan :string
#  tematik    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tahun_id   :bigint           not null
#
# Indexes
#
#  index_tematiks_on_tahun_id  (tahun_id)
#
# Foreign Keys
#
#  fk_rails_...  (tahun_id => tahuns.id)
#
class Tematik < ApplicationRecord
  belongs_to :tahun
end
