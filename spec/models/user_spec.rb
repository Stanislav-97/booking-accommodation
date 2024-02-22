# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  subject(:instance) { build(:user) }

  describe "relations" do
    it { is_expected.to have_many(:users_realties) }
    it { is_expected.to have_many(:realties).through(:users_realties) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:phone) }

    it { is_expected.to validate_uniqueness_of(:phone).case_insensitive }

    it { is_expected.to allow_value("s.zaporozhan97@msil.ru").for(:email) }
  end
end
