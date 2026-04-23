class Track < ApplicationRecord
  ORDERS = %w[
    listeners_count_desc
    listeners_count_asc
  ].freeze

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

  after_create_commit :handle_after_create_commit

  private

  def handle_after_create_commit
    update_tags unless test?
  end

  def update_tags
    Muffon::Worker::Track::Tags::Updater.call(
      artist_name: artist.name,
      track_title: title
    )
  end
end
