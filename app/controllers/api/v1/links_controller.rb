class Api::V1::LinksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    link = Link.create(url: params[:url])

    if link.save
      render json: {success: true, url: link.url, short: link.full_short_url }.as_json
    else
      render json: {success: false, url: link.url, error: link.errors.full_messages }.as_json
    end
  end


  def counter
    begin
      link = Link.find_by!(short: params[:url])

      render json: { success: true, url: link.url, counter: link.counter}.as_json

    rescue ActiveRecord::RecordNotFound
      render json: {error: "Not Implmeneted Yet"}
    end
  end


end
