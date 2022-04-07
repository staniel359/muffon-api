class ProfileArtist < ApplicationRecord
  include ProfileArtistDecorator

  after_create_commit :create_recommendations

  before_destroy :clear_recommendations

  belongs_to :profile
  belongs_to :artist

  has_many :profile_albums, dependent: :destroy
  has_many :profile_tracks, dependent: :destroy

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }

  private

  def create_recommendations
    Profile::Recommendations::CreatorWorker.perform_async(
      recomendation_worker_args
    )
  end

  def recomendation_worker_args
    {
      profile_id:,
      profile_artist_id: id
    }.to_json
  end

  def clear_recommendations
    Profile::Recommendations::ClearerWorker.perform_async(
      recomendation_worker_args
    )
  end
end
