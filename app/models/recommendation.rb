class Recommendation < ApplicationRecord
  belongs_to :profile
  belongs_to :artist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }

  class << self
    def not_deleted
      where.not(
        deleted: true
      )
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

  def profile_artists
    ProfileArtist.where(
      profile_id:,
      id: profile_artist_ids
    )
  end
end
