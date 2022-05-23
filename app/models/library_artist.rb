class LibraryArtist < ApplicationRecord
  include LibraryArtistDecorator

  after_create_commit :add_artist_tags
  after_create_commit :create_recommendations

  before_destroy :clear_recommendations

  belongs_to :profile
  belongs_to :artist

  has_many :library_albums, dependent: :destroy
  has_many :library_tracks, dependent: :destroy

  validates :artist_id,
            uniqueness: {
              scope: :profile_id
            }

  private

  def create_recommendations
    Profile::Recommendations::CreatorWorker.perform_async(
      recomendations_worker_args
    )
  end

  def recomendations_worker_args
    {
      profile_id:,
      library_artist_id: id
    }.to_json
  end

  def clear_recommendations
    Profile::Recommendations::ClearerWorker.perform_async(
      recomendations_worker_args
    )
  end
end
