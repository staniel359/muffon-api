module AlbumDecorator
  module ClassMethods
    def with_artist_title(artist_id, title)
      title_formatted = title.strip.truncate(1_000)

      where(
        artist_id:,
        title_downcase: title_formatted.downcase
      ).first_or_create(
        artist_id:, title: title_formatted
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
