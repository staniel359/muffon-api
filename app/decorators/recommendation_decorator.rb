module RecommendationDecorator
  extend ActiveSupport::Concern

  class_methods do
    def not_deleted
      where(
        deleted: false
      )
    end

    def library_artists_count_desc_ordered
      with_library_artists_count
        .order(
          'library_artist_ids_size DESC'
        ).created_asc_ordered
    end

    def with_library_artists_count
      select(
        'recommendations.*, ' \
        'ARRAY_LENGTH(library_artist_ids, 1) ' \
        'as library_artist_ids_size'
      )
    end

    def library_artists_count_asc_ordered
      with_library_artists_count
        .order(
          'library_artist_ids_size ASC'
        ).created_asc_ordered
    end

    def with_artists(artists, profile_id)
      ids = profile(
        profile_id
      ).artists_library_artist_ids(
        artists
      )

      where(
        'library_artist_ids @> ARRAY[?]',
        (ids.presence || [0])
      )
    end

    def without_artists(artists, profile_id)
      ids = profile(
        profile_id
      ).artists_library_artist_ids(
        artists
      )

      where
        .not(
          'library_artist_ids && ARRAY[?]',
          (ids.presence || [0])
        )
    end

    def with_tags(tags)
      left_joins(:artist)
        .where(
          'artists.tag_ids @> ARRAY[?]',
          tag_ids(tags)
        )
    end

    def without_tags(tags)
      left_joins(:artist)
        .where
        .not(
          'artists.tag_ids && ARRAY[?]',
          tag_ids(tags)
        )
    end

    def not_in_library(profile_id, tracks_count = 0)
      ids = profile(
        profile_id
      ).artist_ids_from_library(
        tracks_count
      )

      where
        .not(
          'artist_id = ANY(ARRAY[?])',
          (ids.presence || [0])
        )
    end

    def not_in_listened(profile_id)
      ids = profile(
        profile_id
      ).artists_ids_from_listened

      where
        .not(
          'artist_id = ANY(ARRAY[?])',
          (ids.presence || [0])
        )
    end

    private

    def tag_ids(tags)
      tags.map do |name|
        tag_id(name)
      end.compact
    end

    def tag_id(name)
      Tag.with_name(
        name
      )&.id
    end

    def profile(profile_id)
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
end
