require "rails_helper"

RSpec.describe Prices::Updater, type: :service do
  subject(:service_call) { described_class.new(realty, attrs).call }

  let(:realty) { create(:realty) }
  let(:attrs) do
    {
      date: Date.current.to_s,
      amount: 1000
    }
  end

  before do
    create(:price, realty:, date: Date.current, amount: 1000)
  end

  it "price exists" do
    service_call
    expect(Price.last).to(have_attributes(amount: 1500.0, date_from: Date.current))
  end

  it "no price" do
    service_call
    expect(Price.last).to(have_attributes(amount: 1000.0, date_from: Date.current))
  end
end
