class LinksController < ApplicationController

  def show
    begin

      link = Link.find_by!(short: params[:short])

      link.count += 1
      link.save

      redirect_to link.url

    rescue ActiveRecord::RecordNotFound
      render :show
    end
  end

end
