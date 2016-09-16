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

    context "invalid attributes" do
      it "returns the validation error in JSON" do
        post :create, format: :json

        expect(JSON.parse(response.body)).to eq({"success"=>false, "url"=>nil, "error"=>["Url can't be blank", "Url is invalid"]})
      end

      it "returns the validation error in JSON" do
        post :create, format: :json, url: "something-that-fails-the-regex"

        expect(JSON.parse(response.body)).to eq({"success" => false, "url" => "something-that-fails-the-regex", "error" => ["Url is invalid"]})
      end

    end
  end
end



