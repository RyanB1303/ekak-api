# == Schema Information
#
# Table name: opds
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(TRUE)
#  kode_opd   :string           not null
#  nama_opd   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lembaga_id :bigint           not null
#
# Indexes
#
#  index_opds_on_lembaga_id  (lembaga_id)
#
# Foreign Keys
#
#  fk_rails_...  (lembaga_id => lembagas.id)
#
require 'rails_helper'

RSpec.describe Opd, type: :model do
  it { should belong_to :lembaga }
  it { should have_many :profiles }
  it { should have_many :users }
  it { should have_many :tujuans }
  it { should validate_presence_of :nama_opd }
  it { should validate_presence_of :kode_opd }
end
