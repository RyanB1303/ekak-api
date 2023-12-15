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
require 'rails_helper'

RSpec.describe Urusan, type: :model do
  it { should validate_presence_of :urusan }
  it { should validate_presence_of :kode_urusan }
  it { should validate_length_of(:kode_urusan).is_equal_to(1) }
end
