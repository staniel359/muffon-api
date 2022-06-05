class Track < ApplicationRecord
  include TrackDecorator

  belongs_to :artist

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
            unless: -> { Rails.env.test? }
end
