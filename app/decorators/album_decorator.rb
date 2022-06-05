module AlbumDecorator
  module ClassMethods
    def with_artist_title(artist_id, title)
      where(
        artist_id:,
        title_downcase: title.strip.downcase
      ).first_or_create(
        artist_id:,
        title: title.strip
      )
    rescue ActiveRecord::RecordNotUnique
      clear_cache

      retry
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
