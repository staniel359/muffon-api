module TrackDecorator
  module ClassMethods
    def with_artist_title_extra_title(artist_id, title, extra_title)
      where(
        find_params(artist_id, title, extra_title)
      ).first_or_create(
        create_params(title, extra_title)
      )
    rescue ActiveRecord::RecordNotUnique
      clear_cache

      retry
    end

    def associated
      includes(:artist)
    end

    private

    def find_params(artist_id, title, extra_title)
      {
        artist_id:,
        title_downcase:
          title.strip.downcase,
        extra_title_downcase:
          extra_title&.strip&.downcase
      }
    end

    def create_params(title, extra_title)
      {
        title: title.strip,
        extra_title: extra_title&.strip,
        player_id:
      }
    end

    def player_id
      return if Rails.env.test?

      SecureRandom.uuid
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
