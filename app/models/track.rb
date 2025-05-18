class Track < ApplicationRecord
  include TrackDecorator

  validates :title,
            presence: true

  validates :title_downcase,
            presence: true,
            uniqueness: {
              scope: :artist_id
            }

  validates :player_id,
            presence: true,
            uniqueness: true,
            unless: -> { test? }

  has_many :library_tracks,
           dependent: nil

  has_many :listened_tracks,
           dependent: nil

  has_many :profiles,
           -> { distinct },
           through: :library_tracks,
           dependent: nil

  belongs_to :artist
end
