class Api::V1::LinksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    link = Link.create(url: params[:url])

    if link.save
      render json: {success: true, url: link.url, short: link.full_short_url }.as_json
    else
      render json: {message: "not yet implemented"}
    end
  end


end
