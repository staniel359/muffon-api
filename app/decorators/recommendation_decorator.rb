module RecommendationDecorator
  module ClassMethods
    def not_deleted
      where(deleted: false)
    end

    def profile_artists_count_desc_ordered
      select(
        'recommendations.*,'\
        ' ARRAY_LENGTH(profile_artist_ids, 1)'\
        ' as profile_artist_ids_size'
      ).order(
        'profile_artist_ids_size DESC,'\
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

  def profile_artists
    ProfileArtist.where(
      profile_id:,
      id: profile_artist_ids
    )
  end
end
