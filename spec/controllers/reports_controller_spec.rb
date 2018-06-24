require 'rails_helper'

RSpec.describe ReportsController, type: :controller do

  describe "GET #index" do
    it "returns http success on json requests" do
      request.accept = "application/json"
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "returns http success on html requests" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
