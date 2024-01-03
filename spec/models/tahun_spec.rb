# == Schema Information
#
# Table name: tahuns
#
#  id                :bigint           not null, primary key
#  kelompok_anggaran :string
#  keterangan        :string
#  tahun             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  periode_id        :bigint           not null
#
# Indexes
#
#  index_tahuns_on_periode_id  (periode_id)
#
# Foreign Keys
#
#  fk_rails_...  (periode_id => periodes.id)
#
require 'rails_helper'

RSpec.describe Tahun, type: :model do
  it { should belong_to :periode }
  it { should have_many :kelompok_anggarans }
  it { should validate_presence_of :tahun }
end
