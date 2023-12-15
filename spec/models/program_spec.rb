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
require 'rails_helper'

RSpec.describe Program, type: :model do
  it { should validate_presence_of :program }
  it { should validate_presence_of :kode_program }
  it { should validate_length_of(:kode_program).is_equal_to(7) }
end
