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

  describe "#counter" do
    context "valid JSON data" do

      it "returns the url count" do
        link = Link.create!(url: "http://www.google.com", counter: 7)
        link.shorten

        get :counter, url: link.short

        expect(JSON.parse(response.body)).to eq({"success" => true, "url" => "http://www.google.com", "counter" => 7})
      end
    end


    context "a url that doesn't exist" do
      it "returns an error message" do
        get :counter, url: "link that doesn't exist"

        expect(JSON.parse(response.body)).to eq({"error" => "Woops, nothing there"})

      end
    end
  end

  describe "#urls" do
    context "valid JSON data" do
      subject {post :urls, format: :json, urls: ["http://www.google.com", "http://www.yahoo.com", "http://www.bing.com"]}

      it "returns an array of shortened urls" do
        subject

        expect(JSON.parse(response.body)).to match_array({"urls"=>[{"success"=>true, "url"=>"http://www.google.com", "short"=>"localhost:3000/1"}, {"success"=>true, "url"=>"http://www.yahoo.com", "short"=>"localhost:3000/2"}, {"success"=>true, "url"=>"http://www.bing.com", "short"=>"localhost:3000/3"}]})

      end
    end
  end


end



