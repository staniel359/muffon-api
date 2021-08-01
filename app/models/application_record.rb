class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def url_helpers
    Rails.application.routes.url_helpers
  end

  def host
    Rails.application.credentials.url
  end
end
