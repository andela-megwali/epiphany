require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "before_action" do
    it { is_expected.to use_before_action(:set_user) }
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    it "creates a new user" do
      post :create, user: attributes_for(:user)
      expect(response).to redirect_to root_path
      expect(assigns(:user).firstname).to eq "TJ"
      expect(User.count).to eq 1
    end
  end

  describe "GET #edit" do
    before { create :user }
    it "returns http success" do
      get :edit, id: 1
      expect(response).to have_http_status(:success)
      expect(response).to render_template("edit")
    end
  end

  # describe "GET #show" do
  #   before { create :user }
  #   it "returns http success" do
  #     get :show, id: 1
  #     expect(response).to have_http_status(:success)
  #     expect(response).to render_template("show")
  #     expect(assigns(:user)).to eq user_path(1)
  #   end
  # end

end
