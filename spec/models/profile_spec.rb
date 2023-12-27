# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  aktif      :boolean          default(TRUE)
#  nama       :string           not null
#  nip        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  opd_id     :bigint           not null
#
# Indexes
#
#  index_profiles_on_opd_id  (opd_id)
#
# Foreign Keys
#
#  fk_rails_...  (opd_id => opds.id)
#
require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to :opd }
  it { should belong_to :user }
  it { should validate_presence_of :nama }
  it { should validate_presence_of :nip }
  it { should validate_length_of(:nip).is_equal_to(18) }
end
