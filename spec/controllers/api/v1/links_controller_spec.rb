require 'rails_helper'

RSpec.describe Api::V1::LinksController, type: :controller do

  describe "#create" do
    context "valid link data" do
      subject { post :create, format: :json,  url: "http://www.google.com" }

      it "returns http status success" do
        subject
        expect(response).to have_http_status(:success)
      end

      it "it increases the Link count by 1" do
        expect{subject}.to change(Link, :count).by(1)
      end

      it "returns a json response" do
        subject
        expect(JSON.parse(response.body)).to eq({"success" => true, "url" =>"http://www.google.com", "short" => Link.last.full_short_url})
      end
    end


  end
end

