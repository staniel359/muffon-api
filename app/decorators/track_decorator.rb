module TrackDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_artist_title(
      artist_id:,
      title:
    )
      with_cache_clearance_and_retry_on_error do
        title_formatted =
          title
          .strip
          .truncate(
            1_000
          )

        where(
          artist_id:,
          title_downcase:
            title_formatted.downcase
        )
          .first_or_create!(
            title: title_formatted,
            player_id:
          )
      end
    end

    def with_tags(
      tags_names
    )
      where(
        'tags_ids::integer[] @> ARRAY[?]::integer[]',
        tags_ids(
          tags_names
        )
      )
    end

    def associated
      includes(
        :artist
      )
    end

    def listeners_count_desc_ordered
      order(
        listeners_count: :desc
      )
    end

    def listeners_count_asc_ordered
      order(
        listeners_count: :asc
      )
    end

    private

    def player_id
      return if test?

      SecureRandom.uuid
    end

    def tags_ids(
      tags_names
    )
      Tag
        .with_names(tags_names)
        .pluck(:id)
    end
  end

  def profiles_count
    profiles
      .not_deleted
      .count
  end
end
