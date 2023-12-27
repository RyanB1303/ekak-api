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
class Profile < ApplicationRecord
  belongs_to :opd
  belongs_to :user, foreign_key: :nip, primary_key: :nip

  validates :nama, presence: true
  validates :nip, presence: true, length: { is: 18 }
end
