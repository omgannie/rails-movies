require 'rails_helper'

describe Category do
  let(:category) {Category.new}

  describe "category" do
    it "has a genre" do
      category = Category.create(genre: "Horror")
      expect(category.genre).to eq "Horror"
    end

    it "should be ok with associated genres" do
      category.genre = Genre.new
      Category.should have(:no).errors_on(:genre)
    end
  end
end
