require "rails_helper"

RSpec.describe UsersRealty, type: :model do
  subject(:instance) { build(:users_realty) }

  describe "relations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:realty) }
  end
end
