module RecommendationArtistDecorator
  extend ActiveSupport::Concern

  class_methods do
    def not_deleted
      where(
        deleted: false
      )
    end

    def associated
      includes(
        artist: {
          library_artists: :library_tracks
        }
      )
    end

    def joined
      left_joins(
        :artist
      )
    end

    def library_artists_count_desc_ordered
      with_library_artists_count
        .order(
          library_artist_ids_size: :desc
        )
        .created_asc_ordered
    end

    def with_library_artists_count
      select(
        <<~SQL.squish
          recommendation_artists.*,
          ARRAY_LENGTH(library_artist_ids, 1)
          AS library_artist_ids_size
        SQL
      )
    end

    def library_artists_count_asc_ordered
      with_library_artists_count
        .order(
          library_artist_ids_size: :asc
        )
        .created_asc_ordered
    end

    def with_artists(
      artists,
      profile_id:
    )
      artists_ids =
        profile_record(
          profile_id
        ).artists_library_artists_ids(
          artists
        )

      where(
        'library_artist_ids @> ARRAY[?]',
        artists_ids
      )
    end

    def without_artists(
      artists,
      profile_id:
    )
      artists_ids =
        profile_record(
          profile_id
        ).artists_library_artists_ids(
          artists
        )

      where
        .not(
          'library_artist_ids && ARRAY[?]',
          artists_ids
        )
    end

    def with_tags(
      tags_names
    )
      where(
        'artists.tags_ids::integer[] @> ARRAY[?]::integer[]',
        tags_ids(
          tags_names
        )
      )
    end

    def without_tags(
      tags_names
    )
      where
        .not(
          'artists.tags_ids::integer[] && ARRAY[?]::integer[]',
          tags_ids(
            tags_names
          )
        )
    end

    def artists_not_in_library(
      profile_id:,
      tracks_count: 0
    )
      joins(
        <<~SQL.squish
          LEFT OUTER JOIN library_artists
            ON (
              library_artists.artist_id = artists.id
                AND library_artists.profile_id = #{profile_id}
                AND library_artists.library_tracks_count >= #{tracks_count}
            )
        SQL
      ).where(
        library_artists: {
          id: nil
        }
      )
    end

    def artists_not_in_listened(
      profile_id:
    )
      joins(
        <<~SQL.squish
          LEFT OUTER JOIN listened_artists
            ON (
              listened_artists.artist_id = artists.id
                AND listened_artists.profile_id = #{profile_id}
            )
        SQL
      ).where(
        {
          listened_artists: {
            id: nil
          }
        }
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

    def profile_record(
      profile_id
    )
      Profile.find_by(
        id: profile_id
      )
    end
  end

  def library_artists
    LibraryArtist.where(
      profile_id:,
      id: library_artist_ids
    )
  end

  def artists_count
    library_artist_ids.size
  end
end
