class ProfileArtist < ApplicationRecord
  after_create_commit :create_recommendations
  before_destroy :clear_recommendations

  belongs_to :profile
  belongs_to :artist

  has_many :profile_albums,
           dependent: :destroy
  has_many :profile_tracks,
           dependent: :destroy

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }

  private

  def create_recommendations
    Recommendations::CreatorWorker.perform_async(
      profile_id: profile_id,
      profile_artist_id: id
    )
  end

  def clear_recommendations
    Recommendations::ClearerWorker.perform_async(
      profile_id: profile_id,
      profile_artist_id: id
    )
  end
end
