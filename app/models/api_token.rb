# == Schema Information
#
# Table name: api_tokens
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  token      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_api_tokens_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class ApiToken < ApplicationRecord
  belongs_to :user
  validates :token, presence: true, uniqueness: true

  before_validation :generate_token, on: :create
  encrypts :token, deterministic: true

  private

  def generate_token
    self.token = Digest::MD5.hexdigest(SecureRandom.hex)
  end
end
