class ApplicationRecord < ActiveRecord::Base
  TRANSACTION_RETRIES_COUNT = 3
  TRANSACTION_RETRIES_INTERVAL = 1

  self.abstract_class = true

  include Muffon::Mixins::Errors

  class << self
    def with_cache_clearance_and_retry_on_error(retries_made: 0, &)
      yield
    rescue ActiveRecord::RecordNotUnique, ActiveRecord::RecordInvalid => e
      clear_cache

      is_retry = retries_made < TRANSACTION_RETRIES_COUNT

      raise e unless is_retry

      sleep TRANSACTION_RETRIES_INTERVAL

      with_cache_clearance_and_retry_on_error(
        retries_made: retries_made + 1,
        &
      )
    end

    def ordered(
      order,
      default_order
    )
      is_known_order =
        order.in?(
          self::ORDERS
        )

      order_formatted =
        if is_known_order
          order
        else
          default_order
        end

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

    def test?
      Rails.env.test?
    end

    def with_tags(
      tags_names:
    )
      where(
        'tags_ids::integer[] @> ARRAY[?]::integer[]',
        tags_ids_from_names(tags_names:)
      )
    end

    def tags_ids_from_names(
      tags_names:
    )
      Tag
        .with_names(tags_names)
        .pluck(:id)
    end

    private

    def clear_cache
      ActiveRecord::Base
        .connection
        .clear_query_cache
    end

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
    Muffon::Formatter::Image.call(
      image:
    )
  end

  def images_data
    images.map do |image|
      Muffon::Formatter::Image.call(
        image:
      )
    end
  end

  def errors?
    errors.present?
  end

  def errors_data
    {
      **error_response_data(
        'forbidden'
      ),
      **errors_formatted_data
    }
  end

  def playlists_count
    profile_playlists.count
  end

  def profile_playlists
    Playlist.where(
      id: playlists_ids
    )
  end

  def listeners_count
    return 0 if test?

    attributes['listeners_count']
  end

  def profiles_count
    profiles
      .not_deleted
      .count
  end

  def attachments_data
    Muffon::Utils::Sendable::Attachments.call(
      model_record: self
    )
  end

  def attachments_minimal_data
    Muffon::Utils::Sendable::Attachments.call(
      model_record: self,
      is_minimal: true
    )
  end

  def set_tags!(
    tags_names:
  )
    tags_ids_formatted =
      self
      .class
      .tags_ids_from_names(tags_names:)
      .sort

    update!(
      tags_ids: tags_ids_formatted
    )
  end

  private

  def errors_formatted_data
    { errors: errors_formatted }
  end

  def errors_formatted
    errors.map do |error|
      { error.attribute => error.type }
    end
  end

  def test?
    Rails.env.test?
  end
end
