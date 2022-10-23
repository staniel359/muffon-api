class Playlist < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
    updated_desc
    updated_asc
    tracks_count_desc
    tracks_count_asc
  ].freeze

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
