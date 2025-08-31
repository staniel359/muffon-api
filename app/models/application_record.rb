class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Muffon::Utils::Errors
  include Muffon::Utils::Image::Processing
  include ApplicationRecordDecorator

  class << self
    def clear_cache
      ActiveRecord::Base
        .connection
        .clear_query_cache
    end

    def test?
      Rails.env.test?
    end
  end

  private

  def update_artist_tags
    artist.update_tags
  end

  def test?
    Rails.env.test?
  end
end
