require "rails_helper"

RSpec.describe AuthTokens::Creator, type: :service do
  subject(:service_call) { described_class.new(user).call }

  context "when create a token" do
    let(:user) { create(:user) }

    it "token created" do
      expect { service_call }.to change(AuthToken, :count).by(1)
    end

    it "token current user" do
      service_call
      expect(AuthToken.last).to have_attributes(user_id: user.id)
    end
  end

  context "token update" do
    let(:user) { create(:user) }

    let!(:auth_token) { create(:auth_token, user:) }

    it "token update" do
      service_call
      expect(user.reload.auth_token.token).not_to eq(auth_token.token)
    end
  end
end
