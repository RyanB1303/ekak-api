# == Schema Information
#
# Table name: indikators
#
#  id                 :bigint           not null, primary key
#  indikator          :string
#  indikatorable_type :string
#  keterangan         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  indikatorable_id   :bigint
#
# Indexes
#
#  index_indikators_on_indikatorable  (indikatorable_type,indikatorable_id)
#
require 'rails_helper'

RSpec.describe Indikator, type: :model do
  it { should belong_to :indikatorable }
  it { should validate_presence_of :indikator }
end
