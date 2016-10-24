require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "GET #sign_up" do
    it "returns http success" do
      get :sign_up
      expect(response).to have_http_status(:success)
    end
  end

end
