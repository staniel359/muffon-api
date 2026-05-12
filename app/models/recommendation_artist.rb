class RecommendationArtist < ApplicationRecord
  ORDERS = %w[
    library_artists_count_desc
    library_artists_count_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    deleted
  ].freeze

  include EventableArtist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }

  belongs_to :profile

  belongs_to :artist

  class << self
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
      artists_names:,
      profile_id:
    )
      where(
        'library_artist_ids::integer[] @> ARRAY[?]::integer[]',
        artists_library_artists_ids(
          artists_names:,
          profile_id:
        )
      )
    end

    def without_artists(
      artists_names:,
      profile_id:
    )
      where.not(
        'library_artist_ids::integer[] && ARRAY[?]::integer[]',
        artists_library_artists_ids(
          artists_names:,
          profile_id:
        )
      )
    end

    def without_tags(
      tags_names:
    )
      where.not(
        'tags_ids::integer[] && ARRAY[?]::integer[]',
        tags_ids_from_names(tags_names:)
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

    def artists_library_artists_ids(
      artists_names:,
      profile_id:
    )
      artists_ids =
        Artist
        .with_names(
          artists_names
        )
        .pluck(:id)

      LibraryArtist
        .where(
          profile_id:,
          artist_id: artists_ids
        )
        .pluck(:id)
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

  def soft_delete
    update!(
      deleted: true
    )

    add_deleted_event
  end
end
