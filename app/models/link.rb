class Link < ActiveRecord::Base

  def shorten
    self.short = self.id.to_s(36)
    self.save
  end

end
