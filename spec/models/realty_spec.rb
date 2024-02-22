# frozen_string_literal: true

require "rails_helper"

RSpec.describe Realty, type: :model do
  subject(:instance) { build(:realty) }

  describe "relations" do
    it { is_expected.to belong_to(:organization) }
    it { is_expected.to have_many(:prices) }
    it { is_expected.to have_many(:bookings) }

    it { is_expected.to have_many(:realties_facilities) }
    it { is_expected.to have_many(:facilities).through(:realties_facilities) }

    it { is_expected.to have_many(:users_realties) }
    it { is_expected.to have_many(:users).through(:users_realties) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:lat) }
    it { is_expected.to validate_presence_of(:lon) }
    it { is_expected.to validate_presence_of(:base_price) }
    it { is_expected.to validate_presence_of(:realty_type) }
    it { is_expected.to validate_presence_of(:floor) }
    it { is_expected.to validate_presence_of(:building_year) }

    it { is_expected.to validate_comparison_of(:area).is_greater_than(0) }
    it { is_expected.to validate_comparison_of(:rooms_count).is_greater_than(0) }
    it { is_expected.to validate_comparison_of(:entrance).is_greater_than(0) }
  end
end
