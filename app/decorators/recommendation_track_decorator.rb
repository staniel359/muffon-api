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
        [track: :artist]
      )
    end

    def joined
      left_joins(
        track: [
          :library_tracks,
          :listened_tracks,
          [artist: :listened_artists]
        ]
      )
    end

    def library_tracks_count_desc_ordered
      with_library_tracks_count
        .order(
          'library_track_ids_size DESC'
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
          'library_track_ids_size ASC'
        )
        .created_asc_ordered
    end

    def tracks_not_in_library
      where(
        library_tracks: {
          id: nil
        }
      )
    end

    def artists_not_in_library(
      tracks_count: 0
    )
      joins(
        <<~SQL.squish
          LEFT OUTER JOIN library_artists
            ON (
              library_artists.artist_id = artists.id
                AND library_artists.library_tracks_count >= #{tracks_count}
            )
        SQL
      ).where(
        library_artists: {
          id: nil
        }
      )
    end

    def tracks_not_in_listened
      where(
        listened_tracks: {
          id: nil
        }
      )
    end

    def artists_not_in_listened
      where(
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
