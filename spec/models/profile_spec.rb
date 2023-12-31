# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  aktif      :boolean          default(TRUE)
#  nama       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  opd_id     :bigint
#  user_id    :bigint           not null
#
# Indexes
#
#  index_profiles_on_opd_id   (opd_id)
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to :user }
  it { should belong_to(:opd).optional }
  it { should validate_presence_of :nama }
end
