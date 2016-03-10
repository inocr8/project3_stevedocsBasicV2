require 'rails_helper'

RSpec.describe AdminsController, type: :controller do

  describe "GET #actions" do
    it "returns http success" do
      get :actions
      expect(response).to have_http_status(:success)
    end
  end

end