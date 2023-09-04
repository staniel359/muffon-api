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

    def library_tracks_count_desc_ordered
      with_library_tracks_count
        .order(
          'library_track_ids_size DESC'
        ).created_asc_ordered
    end

    def with_library_tracks_count
      select(
        'recommendation_tracks.*, ' \
        'ARRAY_LENGTH(library_track_ids, 1) ' \
        'as library_track_ids_size'
      )
    end

    def library_tracks_count_asc_ordered
      with_library_tracks_count
        .order(
          'library_track_ids_size ASC'
        ).created_asc_ordered
    end

    def tracks_not_in_library(profile_id)
      ids = profile(
        profile_id
      ).track_ids_from_library

      where
        .not(
          'track_id = ANY(ARRAY[?])',
          (ids.presence || [0])
        )
    end

    def artists_not_in_library(profile_id, tracks_count = 0)
      ids = profile(
        profile_id
      ).artist_ids_from_library(
        tracks_count
      )

      left_joins(:track)
        .where.not(
          'tracks.artist_id = ANY(ARRAY[?])',
          (ids.presence || [0])
        )
    end

    def tracks_not_in_listened(profile_id)
      ids = profile(
        profile_id
      ).track_ids_from_listened

      where
        .not(
          'track_id = ANY(ARRAY[?])',
          (ids.presence || [0])
        )
    end

    def artists_not_in_listened(profile_id)
      ids = profile(
        profile_id
      ).artist_ids_from_listened

      left_joins(:track)
        .where
        .not(
          'tracks.artist_id = ANY(ARRAY[?])',
          (ids.presence || [0])
        )
    end

    private

    def profile(profile_id)
      Profile.find_by(
        id: profile_id
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
