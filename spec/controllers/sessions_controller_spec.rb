require 'rails_helper'

describe SessionsController do
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
end
