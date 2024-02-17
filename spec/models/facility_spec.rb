require 'rails_helper'

RSpec.describe Facility, type: :model do
  subject(:instance) { build(:facility) }

  describe 'relations' do
    it { is_expected.to have_many(:realties_facilities) }
    it { is_expected.to have_many(:realties).through(:realties_facilities) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:icon) }
  end
end
