require "rails_helper"

RSpec.describe Prices::Updater, type: :service do
  subject(:service_call) { described_class.new(realty, attrs).call }

  let(:realty) { create(:realty) }
  let(:attrs) do
    [
      {
        date: "2024-01-01",
        amount: 5000
      },
      {
        date: "2024-01-02",
        amount: 6900
      },
      {
        date: "2024-01-03",
        amount: 8000
      }
    ]
  end

  let!(:price) { create(:price, realty:, date: "2024-01-02", amount: 6000) }

  let(:grouped_prices) { realty.prices.index_by(&:date) }

  it "updates existing price" do
    service_call
    expect(price.reload).to have_attributes(amount: 6900)
  end

  it "ensures create prices" do
    expect { service_call }.to change(Price, :count).from(1).to(3)
  end

  it "ensures created prices have correct attributes" do
    service_call
    expect(grouped_prices["2024-01-01".to_date]).to have_attributes(amount: 5000)
    expect(grouped_prices["2024-01-03".to_date]).to have_attributes(amount: 8000)
  end
end
