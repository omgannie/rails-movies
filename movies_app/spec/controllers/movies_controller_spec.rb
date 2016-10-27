require 'rails_helper'

describe MoviesController do
  let!(:movie) { Movie.create!(title: "Ne Le Dis A Personne", cast: "Angelina Jolie", synopsis: "Murder mystery", poster_url: "https://images-na.ssl-images-amazon.com/images/I/51iVTqHDQDL.jpg", release_date: DateTime.new(2001,2,3))}

  describe "GET #index" do
    it "responds with a status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "displays all of the movies" do
      get :index
      expect(assigns(:movies)).to eq(Movie.recent)
    end
  end
end
