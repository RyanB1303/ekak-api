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
FactoryBot.define do
  factory :api_token do
    user { nil }
    token { "MyText" }
    active { false }
  end
end