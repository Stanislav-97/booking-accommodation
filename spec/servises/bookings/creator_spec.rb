require "rails_helper"

RSpec.describe Bookings::Creator, type: :service do
  subject(:service_call) { described_class.new(realty, user, attrs).call }

  let(:realty) { create(:realty, base_price: 1000) }
  let(:user) { create(:user) }
  let(:user_attrs) do
    {
      fio: "#{user.first_name} #{user.last_name}",
      email: user.email,
      phone: user.phone
    }
  end
  let(:attrs) do
    {
      date_from: Date.current.to_s,
      date_to: (Date.current + 2.days).to_s,
      paid_amount: 400.0
    }
  end

  before do
    create(:price, realty:, date: Date.current, amount: 5000)
  end

  it "ensures created one booking" do
    expect { service_call }.to change(Booking, :count).from(0).to(1)
  end

  it "has correct attributes" do
    service_call
    expect(Booking.last).to(have_attributes(amount: 6000.0, **attrs, **user_attrs, date_from: Date.current,
                                            date_to: (Date.current + 2.days)))
  end
end
