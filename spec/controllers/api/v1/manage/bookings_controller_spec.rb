require "rails_helper"

RSpec.describe Api::V1::Manage::BookingsController, type: :controller do
  describe "GET #index" do
    it "returns a 209 custom status code" do
      get :index
      expect(response).to have_http_status(209)
    end
  end
end
