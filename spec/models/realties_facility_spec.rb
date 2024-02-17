require 'rails_helper'

RSpec.describe RealtiesFacility, type: :model do
  subject(:instance) { build(:realties_facility) }

  describe 'relations' do
    it { is_expected.to belong_to(:realty) }
    it { is_expected.to belong_to(:facility) }
  end
end