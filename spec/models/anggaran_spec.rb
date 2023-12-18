# == Schema Information
#
# Table name: anggarans
#
#  id                :bigint           not null, primary key
#  anggaranable_type :string
#  keterangan        :string
#  kode              :string
#  tahun             :integer
#  total             :decimal(, )      default(0.0)
#  uraian            :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  anggaranable_id   :bigint
#
# Indexes
#
#  index_anggarans_on_anggaranable  (anggaranable_type,anggaranable_id)
#
require 'rails_helper'

RSpec.describe Anggaran, type: :model do
  it { should belong_to :anggaranable }
  it { should validate_presence_of :uraian }
  it { should validate_presence_of :tahun }
end
