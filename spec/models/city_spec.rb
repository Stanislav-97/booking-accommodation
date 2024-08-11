require "rails_helper"

RSpec.describe City, type: :model do
  subject(:instance) { build(:city) }

  describe "relations" do
    it { is_expected.to have_many(:realties) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
