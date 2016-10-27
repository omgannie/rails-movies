require 'rails_helper'

describe Movie do
  let(:movie) {Movie.new}

  describe "movie" do
    it "has a title" do
      movie = Movie.create(title: "My movie", release_date: "2016", cast: "Joel", synopsis: "Joel is a superhero")
      expect(song.title).to eq "My movie"
    end

    it "has a release_date" do
      movie = Movie.create(title: "My movie", release_date: "2016", cast: "Joel", synopsis: "Joel is a superhero")
      expect(song.release_date).to eq "2016"
    end

    it "has a cast" do
      movie = Movie.create(title: "My movie", release_date: "2016", cast: "Joel", synopsis: "Joel is a superhero")
      expect(song.cast).to eq "Joel"
    end

    it "has a synopsis" do
      movie = Movie.create(title: "My movie", release_date: "2016", cast: "Joel", synopsis: "Joel is a superhero")
      expect(song.synopsis).to eq "Joel is a superhero"
    end
  end
end
