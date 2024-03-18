require "rails_helper"

RSpec.describe RealtiesController, type: :controller do

  controller do
    def index
      render :json => {}, :status => 209
    end
  end

  describe "GET #index" do
    it "returns a 209 custom status code" do
      get :index
      expect(response).to have_http_status(209)
    end
  end
end