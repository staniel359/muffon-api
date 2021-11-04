class Recommendation < ApplicationRecord
  belongs_to :profile
  belongs_to :artist

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }

  scope :not_deleted, -> { where.not(deleted: true) }

  def profile_artists
    ProfileArtist.where(
      profile_id: profile_id,
      id: profile_artist_ids
    ).order(
      profile_tracks_count: :desc,
      profile_albums_count: :desc,
      created_at: :asc
    )
  end
end
