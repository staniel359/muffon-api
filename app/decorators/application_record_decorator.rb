module ApplicationRecordDecorator
  module ClassMethods
    def created_desc_ordered
      order(
        created_at: :desc
      )
    end

    def created_asc_ordered
      order(
        created_at: :asc
      )
    end

    def library_tracks_count_desc_ordered
      order(
        library_tracks_count: :desc
      )
    end

    def public
      where(
        private: false
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  def image_data
    image_data_formatted(
      image
    )
  end

  def images_data
    images.map do |i|
      image_data_formatted(i)
    end
  end

  def errors?
    errors.present?
  end

  def errors_data
    forbidden.merge(
      { errors: errors_formatted }
    )
  end

  def profile_playlists
    Playlist.where(
      id: playlist_ids
    )
  end

  private

  def image_data_formatted(image)
    Muffon::Utils::Image.call(
      image:
    )
  end

  def errors_formatted
    errors.map do |e|
      { e.attribute => e.type }
    end
  end
end
