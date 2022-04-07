class Playlist < ApplicationRecord
  include PlaylistDecorator

  has_one_attached :image

  belongs_to :profile

  has_many :playlist_tracks, dependent: :destroy

  validates :title,
            presence: true,
            uniqueness: {
              scope: :profile_id
            }
end
