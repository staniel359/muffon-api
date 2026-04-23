module ArtistDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_name(
      name
    )
      with_cache_clearance_and_retry_on_error do
        name_formatted =
          name
          .strip
          .truncate(
            1_000
          )

        where(
          name_downcase:
            name_formatted.downcase
        )
          .first_or_create!(
            name: name_formatted
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

    def tags_ids(
      tags_names
    )
      Tag
        .with_names(tags_names)
        .pluck(:id)
    end
  end

  def image_data
    LastFM::Formatter::Image.call(
      image_url:
    )
  end

  def profiles_count
    profiles
      .not_deleted
      .count
  end
end
