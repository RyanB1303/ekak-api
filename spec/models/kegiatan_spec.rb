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
require 'rails_helper'

RSpec.describe Kegiatan, type: :model do
  it { should validate_presence_of :kegiatan }
  it { should validate_presence_of :kode_kegiatan }
  it { should validate_length_of(:kode_kegiatan).is_equal_to(12) }
end
