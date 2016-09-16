class Link < ActiveRecord::Base
  after_create :shorten

  def shorten
    self.short = self.id.to_s(36)
    self.save
  end

end
