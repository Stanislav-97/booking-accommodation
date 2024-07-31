require "rails_helper"

RSpec.describe AuthToken, type: :model do
  subject(:instance) { build(:auth_token) }

  describe "relations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:token) }
    it { is_expected.to validate_presence_of(:expires_at) }

    it { is_expected.to validate_uniqueness_of(:user_id) }
  end
end
