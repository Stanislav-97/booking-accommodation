# frozen_string_literal: true

require "rails_helper"

RSpec.describe RealtiesRate, type: :model do
  # subject(:instance) { build(:realties_facility) }

  describe "relations" do
    it { is_expected.to belong_to(:realty) }
    it { is_expected.to belong_to(:rate) }
  end
end
