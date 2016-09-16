class Link < ActiveRecord::Base
  after_create :shorten

  validates :url, presence: true
  validates :url, format: {with: URI::regexp}



  def shorten
    self.short = self.id.to_s(36)
    self.save
  end

  def full_short_url
    ENV['BASE_URL'] + '/' + self.short
  end



end
