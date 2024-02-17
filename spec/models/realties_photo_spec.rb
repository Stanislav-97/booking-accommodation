require 'rails_helper'

RSpec.describe RealtiesPhoto, type: :model do
  subject(:instance) { build(:realties_photo) }

  describe 'relations' do
    it { is_expected.to belong_to(:realty) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:photo) }
  end
end
