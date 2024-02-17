require 'rails_helper'

RSpec.describe Organization, type: :model do
  subject(:instance) { build(:organization) }

  describe 'relations' do
    it { is_expected.to have_many(:realties) }
    it { is_expected.to have_many(:users) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
