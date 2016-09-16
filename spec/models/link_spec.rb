require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "#shorten" do

    it "creates a base 36 combo and returns a string" do
      link = Link.create(url: "http://www.google.com")

      link.shorten

      expect(link.short).to be_a(String)
    end
  end

end
