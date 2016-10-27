require 'rails_helper'

describe UsersController do
  let!(:user) { User.create!(
            username: "annie_oh",
            email: "annie@oh.com",
            password: "123456",
            trusted_reviewer: true) }

  describe "GET #new" do
    it "responds with a status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with a status code 302" do
        post :create, user: { username: user.username, email: user.email, password: user.password }
        expect(response).to have_http_status 302
      end

      it "creates a new user in the database" do
        post :create, user: { username: user.username, email: user.email, password: user.password }
        expect(assigns(:user).save).to eq true
      end

      it "redirects to the homepage" do
        post :create, user: { username: user.username, email: user.email, password: user.password }
        expect(response).to redirect_to root_path
      end
    end
  end
end
