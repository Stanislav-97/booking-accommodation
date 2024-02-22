# frozen_string_literal: true

require "rails_helper"

RSpec.describe Booking, type: :model do
  subject(:instance) { build(:booking) }

  describe "relations" do
    it { is_expected.to belong_to(:realty) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:fio) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:paid_amount) }

    it { is_expected.to validate_comparison_of(:date_to).is_greater_than(:date_from) }
  end

  describe "validate intersection" do
    subject(:instance) { build(:booking, date_from:, date_to:, realty:) }

    let(:realty) { create(:realty) }

    before do
      create(:booking, date_from: Date.current, date_to: Date.current + 5.days, realty:)
    end

    context "when date_to intersected with booked dates" do
      let(:date_from) { Date.current - 2.days }
      let(:date_to) { Date.current + 2.days }

      it { is_expected.not_to be_valid }
    end

    context "when date_from intersected with booked dates" do
      let(:date_from) { Date.current + 3.days }
      let(:date_to) { Date.current + 8.days }

      it { is_expected.not_to be_valid }
    end

    context "when booked dates intersected with booked dates" do
      let(:date_from) { Date.current - 2.days }
      let(:date_to) { Date.current + 8.days }

      it { is_expected.not_to be_valid }
    end

    context "when the booked dates do not intersected with the booked dates" do
      let(:date_from) { Date.current + 8.days }
      let(:date_to) { Date.current + 14.days }

      it { is_expected.to be_valid }
    end
  end
end
