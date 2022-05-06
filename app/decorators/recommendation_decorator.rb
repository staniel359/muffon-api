module RecommendationDecorator
  module ClassMethods
    def not_deleted
      where(deleted: false)
    end

    def library_artists_count_desc_ordered
      select(
        'recommendations.*,'\
        ' ARRAY_LENGTH(library_artist_ids, 1)'\
        ' as library_artist_ids_size'
      ).order(
        'library_artist_ids_size DESC,'\
        ' recommendations.created_at ASC'
      )
    end

    def associated
      includes(
        artist: image_association
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  def library_artists
    ProfileArtist.where(
      profile_id:,
      id: library_artist_ids
    )
  end
end
