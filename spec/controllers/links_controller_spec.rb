require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe "#show" do
    context "visiting a url" do

      it "it redirects to the url" do
        link = Link.create(url: "http://www.google.com")
        link.shorten

        get :show, short: link.short

        expect(response).to redirect_to(link.url)
      end
    end
  end


end
