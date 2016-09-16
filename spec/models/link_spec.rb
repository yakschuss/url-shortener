require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "#shorten" do

    it "creates a base 36 combo and returns a string" do
      link = Link.create(url: "http://www.google.com")

      link.shorten

      expect(link.short).to be_a(String)
    end
  end


  describe "#full_short_url" do
    it "returns the base url with the url's short" do
      link = Link.create(url: "https://www.google.com")

      expect(link.full_short_url).to eq("localhost:3000/" + link.short)
    end
  end


end
