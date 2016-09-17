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

      it "increases the url counter by 1" do
        link = Link.create(url: "http://www.google.com", counter: 2)

        get :show, short: link.short

        link.reload

        expect(link.counter).to eq(3)
      end
    end

    context "not found" do
      it "renders the show page" do
        get :show, short: "not-found-url"

        expect(response).to render_template(:show)
      end
    end

  end
end


