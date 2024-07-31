require "rails_helper"

RSpec.describe AuthTokens::Creator, type: :service do
  subject(:service_call) { described_class.new(user).call }

  let(:user) { create(:user) }

  let(:auth_token) { create(:auth_token, user:) }

  it "token created" do
    expect { service_call }.to change(AuthToken, :count).by(1)
  end

  it "token current user" do
    service_call
    expect(AuthToken.last).to have_attributes(user_id: user.id)
  end

  it "token update" do
    service_call
    expect(:auth_token).not_to eq(user.auth_token.token)
  end
end
