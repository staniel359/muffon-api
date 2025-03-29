module ApplicationRecordDecorator
  extend ActiveSupport::Concern

  class_methods do
    def ordered(
      order,
      default_order
    )
      in_orders =
        order.in?(
          self::ORDERS
        )

      order_formatted = (
        in_orders ? order : default_order
      )

      send(
        "#{order_formatted}_ordered"
      )
    end

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

    def updated_desc_ordered
      order(
        updated_at: :desc
      )
    end

    def updated_asc_ordered
      order(
        updated_at: :asc
      )
    end

    def library_albums_count_desc_ordered
      order(
        library_albums_count: :desc,
        created_at: :asc
      )
    end

    def library_albums_count_asc_ordered
      order(
        library_albums_count: :asc,
        created_at: :asc
      )
    end

    def library_tracks_count_desc_ordered
      order(
        library_tracks_count: :desc,
        created_at: :asc
      )
    end

    def library_tracks_count_asc_ordered
      order(
        library_tracks_count: :asc,
        created_at: :asc
      )
    end

    def public
      where(
        private: false
      )
    end

    def by_public_profile
      joins(
        :profile
      )
        .where(
          profiles: {
            private: false
          }
        )
    end

    private

    def image_association
      {
        image_attachment:
          image_attachment_association
      }
    end

    def image_attachment_association
      {
        blob: {
          variant_records: {
            image_attachment: :blob
          }
        }
      }
    end

    def images_association
      {
        images_attachments:
          image_attachment_association
      }
    end
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
      errors_formatted_data
    )
  end

  def profile_playlists
    Playlist.where(
      id: playlist_ids
    )
  end

  private

  def image_data_formatted(
    image
  )
    Muffon::Utils::Image.call(
      image:
    )
  end

  def errors_formatted_data
    { errors: errors_formatted }
  end

  def errors_formatted
    errors.map do |error|
      { error.attribute => error.type }
    end
  end
end
