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
require 'rails_helper'

RSpec.describe Subkegiatan, type: :model do
  it { should validate_presence_of :subkegiatan }
  it { should validate_presence_of :kode_subkegiatan }
  it { should validate_length_of(:kode_subkegiatan).is_equal_to(17) }
end
