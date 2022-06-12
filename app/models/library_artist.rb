class LibraryArtist < ApplicationRecord
  include LibraryArtistDecorator

  after_create_commit :update_artist_tags
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
    Muffon::Worker::Profile::Recommendations::Creator.call(
      profile_id:,
      library_artist_id: id
    )
  end

  def clear_recommendations
    Muffon::Worker::Profile::Recommendations::Clearer.call(
      profile_id:,
      library_artist_id: id
    )
  end
end
