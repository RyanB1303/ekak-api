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
require 'rails_helper'

RSpec.describe Tematik, type: :model do
  it { should belong_to :tahun }
  it { should have_many :pohons }
  it { should validate_presence_of :tematik }
  it { should validate_length_of(:tematik).is_at_least(5) }
end
