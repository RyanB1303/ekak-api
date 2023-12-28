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
class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :opd, optional: true

  validates :nama, presence: true
end
