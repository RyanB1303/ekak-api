# == Schema Information
#
# Table name: lembagas
#
#  id           :bigint           not null, primary key
#  active       :boolean          default(TRUE)
#  kode_lembaga :string
#  nama_lembaga :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Lembaga, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
