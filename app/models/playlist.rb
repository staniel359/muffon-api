class Playlist < ApplicationRecord
  belongs_to :profile

  has_one_attached :image

  has_many :playlist_tracks, dependent: :destroy

  validates :title,
            presence: true,
            uniqueness: {
              scope: :profile_id
            }

  class << self
    def associated
      includes(
        image_association
      )
    end
  end
end
