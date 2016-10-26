require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "#index" do
    before { get :index }
    it { is_expected.to render_template("index") }
    it "responds with 200" do
      expect(response.status).to eq 200
    end
  end

  describe "#login" do
    context "with valid login details" do
      before do
        create :user
        post :login, sign_in: attributes_for(:user)
      end
      it { is_expected.to redirect_to root_path }
      it { is_expected.to respond_with 302 }
      it "sets a session" do
        expect(session[:user_id]).to eq 1
      end
    end

    context "with invalid login details" do
      context "when a value is incorrect" do
        before do
          create :user
          post :login, sign_in: { username: "smith", password: "qwertyu" }
        end
        it { is_expected.to redirect_to "index" }
        it { is_expected.to respond_with 302 }
        it "does not set a session" do
          expect(session[:user_id]).to eq nil
        end
      end

      context "when a value is set to nil" do
        before do
          create :user
          post :login, sign_in: { username: nil, password: "qwertyu" }
        end
        it { is_expected.to redirect_to "index" }
        it { is_expected.to respond_with 302 }
        it "does not set a session" do
          expect(session[:user_id]).to eq nil
        end
      end
    end
  end

  describe "#logout" do
    before do
      session[:user_id] = 1
      get :logout
    end
    it { is_expected.to redirect_to root_path }
    it "ends the session" do
      expect(session[:user_id]).to equal(nil)
      expect(response.status).to eq 302
    end
  end
end
