require "rails_helper"

RSpec.describe Realties::Filter, type: :service do
  subject(:service_call) { described_class.new(attrs).call }

  # let(:realty) { create(:realty) }
  # let(:attrs) do
  #   {
  #     area: {from: 50, to: 60},
  #     building_year: {from: 2003, to: 2024},
  #     rooms_count: 3,
  #     realty_type: ["dacha"],
  #     floor:  {from: 2, to: 7},
  #     facility_ids: [2]
  #   }
  # end

  context "when passed area" do
    let(:attrs) do
      {
        area: { from: 30, to: 60 }
      }
    end

    let!(:realty) { create(:realty, area: 40) }

    before do
      create(:realty, area: 20)
      create(:realty, area: 80)
    end

    it "returns correct data" do
      expect(service_call.ids).to match([realty.id])
    end
  end

  context "when passed building_year" do
    let(:attrs) do
      {
        building_year: { from: 2004, to: 2007 }
      }
    end

    let!(:realty) { create(:realty, building_year: 2005) }

    before do
      create(:realty, building_year: 2003)
      create(:realty, building_year: 2008)
    end

    it "returns correct data" do
      expect(service_call.ids).to match([realty.id])
    end
  end

  context "when passed rooms_count" do
    let(:attrs) do
      {
        rooms_count: 5
      }
    end

    let!(:realty) { create(:realty, rooms_count: 5) }

    before do
      create(:realty, rooms_count: 4)
      create(:realty, rooms_count: 6)
    end

    it "returns correct data" do
      expect(service_call.ids).to match([realty.id])
    end
  end

  context "when passed facility_ids" do
    let(:attrs) do
      {
        facility_ids: [facility.id]
      }
    end

    let!(:facility) { create(:facility) }
    let!(:realty) { create(:realty) }

    before do
      create(:realty)
      create(:realty)

      realty.facilities << facility
    end

    it "returns correct data" do
      expect(service_call.ids).to match([realty.id])
    end
  end

  context "when passed realty_type" do
    let(:attrs) do
      {
        realty_type: ["dacha"]
      }
    end

    let!(:realty) { create(:realty, realty_type: "dacha") }

    before do
      create(:realty, realty_type: "flat")
      create(:realty, realty_type: "house")
    end

    it "returns correct data" do
      expect(service_call.ids).to match([realty.id])
    end
  end

  context "when passed floor" do
    let(:attrs) do
      {
        floor: { from: 2, to: 7 }
      }
    end

    let!(:realty) { create(:realty, floor: 5) }

    before do
      create(:realty, floor: 1)
      create(:realty, floor: 8)
    end

    it "returns correct data" do
      expect(service_call.ids).to match([realty.id])
    end
  end
end
