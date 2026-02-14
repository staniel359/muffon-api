module RecommendationTrackDecorator
  extend ActiveSupport::Concern

  class_methods do
    def not_deleted
      where(
        deleted: false
      )
    end

    def associated
      includes(
        [{ track: :artist }]
      )
    end

    def joined
      left_joins(
        [{ track: :artist }]
      )
    end

    def library_tracks_count_desc_ordered
      with_library_tracks_count
        .order(
          library_track_ids_size: :desc
        )
        .created_asc_ordered
    end

    def with_library_tracks_count
      select(
        <<~SQL.squish
          recommendation_tracks.*,
          ARRAY_LENGTH(library_track_ids, 1)
          AS library_track_ids_size
        SQL
      )
    end

    def library_tracks_count_asc_ordered
      with_library_tracks_count
        .order(
          library_track_ids_size: :asc
        )
        .created_asc_ordered
    end

    def tracks_not_in_library(
      profile_id:
    )
      joins(
        <<~SQL.squish
          LEFT OUTER JOIN library_tracks
            ON (
              library_tracks.track_id = recommendation_tracks.track_id
                AND library_tracks.profile_id = #{profile_id}
            )
        SQL
      ).where(
        library_tracks: {
          id: nil
        }
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

    def tracks_not_in_listened(
      profile_id:
    )
      joins(
        <<~SQL.squish
          LEFT OUTER JOIN listened_tracks
            ON (
              listened_tracks.track_id = recommendation_tracks.track_id
                AND listened_tracks.profile_id = #{profile_id}
            )
        SQL
      ).where(
        listened_tracks: {
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
        listened_artists: {
          id: nil
        }
      )
    end
  end

  def library_tracks
    LibraryTrack.where(
      profile_id:,
      id: library_track_ids
    )
  end
end
