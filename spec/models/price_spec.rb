require 'rails_helper'

RSpec.describe Price, type: :model do
  subject(:instance) { build(:price) }

  describe 'relations' do
    it { is_expected.to belong_to(:realty) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:date) }
  end
end
