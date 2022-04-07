module TrackDecorator
  module ClassMethods
    def with_artist_title(artist_id, title)
      where(
        'artist_id = ? AND LOWER(title) = ?',
        artist_id, title.downcase
      ).first_or_create(
        artist_id:, title:, player_id:
      )
    rescue ActiveRecord::RecordNotUnique
      clear_cache

      retry
    end

    def associated
      includes(:artist)
    end

    private

    def player_id
      return '1' if Rails.env.test?

      SecureRandom.uuid
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
