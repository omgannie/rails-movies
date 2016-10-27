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

      it "updates trusted_reviewer to true if the correct key was passed" do
        post :create, user: { username: user.username, email: user.email, password: user.password, key: "monkey" }
        expect(assigns(:user).trusted_reviewer).to eq true
      end

      it "keeps trusted_reviewer to false if the correct key was not passed" do
        post :create, user: { username: user.username, email: user.email, password: user.password }
        expect(assigns(:user).trusted_reviewer).to eq false
      end
    end

    context "when invalid params are passed" do
      it "responds with a status code 200" do
        post :create, user: { username: user.username, email: user.email }
        expect(response).to have_http_status 200
      end

      it "does not create a new user in the database" do
        post :create, user: { username: user.username, email: user.email }
        expect(assigns(:user).save).to eq false
      end

      it "assigns the unsaved user as @user" do
        post :create, user: { username: user.username, email: user.email }
        expect(assigns(:user)).to be_a_new User
      end

      it "renders the :new template" do
        post :create, user: { username: user.username, email: user.email }
        expect(response).to render_template(:new)
      end
    end
  end
end
