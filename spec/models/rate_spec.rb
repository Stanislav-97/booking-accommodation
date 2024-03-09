require "rails_helper"

RSpec.describe Rate, type: :model do
  # subject(:instance) { build(:user) }

  describe "relations" do
    it { is_expected.to have_many(:realties_rates) }
    it { is_expected.to have_many(:realties).through(:realties_rates) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:extra_change) }
    it { is_expected.to validate_presence_of(:extra_change_type) }
  end
end
