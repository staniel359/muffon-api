module RecommendationDecorator
  module ClassMethods
    def not_deleted
      where(deleted: false)
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
  end

  def self.included(base)
    base.extend ClassMethods
  end

  def library_artists
    LibraryArtist.where(
      profile_id:,
      id: library_artist_ids
    )
  end
end
