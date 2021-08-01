class ProfileAlbum < ApplicationRecord
  before_destroy :destroy_image

  belongs_to :profile
  belongs_to :profile_artist,
             counter_cache: true
  belongs_to :album

  has_many :profile_tracks,
           dependent: :destroy

  has_one_attached :image

  validates :album_id,
            uniqueness: {
              scope: :profile_id
            }

  def stored_image_url(size = nil)
    return '' if image.blank?

    if size.present?
      url_helpers.rails_representation_url(
        image_resized(size),
        host: host
      )
    else
      url_helpers.rails_blob_url(
        image,
        host: host
      )
    end
  end

  private

  def image_resized(size)
    image.variant(
      resize_to_limit: [size, size]
    )
  end

  def original_url
    url_helpers.rails_blob_url(
      image, host: host
    )
  end

  def destroy_image
    image.purge
  end
end
