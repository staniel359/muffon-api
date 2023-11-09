class Playlist < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
    updated_desc
    updated_asc
    tracks_count_desc
    tracks_count_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    updated
    deleted
  ].freeze
  EVENT_ATTRIBUTES = %w[
    title
    description
    private
  ].freeze

  include PlaylistDecorator
  include Eventable

  validates :title,
            presence: true,
            uniqueness: {
              scope: :profile_id
            }

  before_destroy :delete_data

  has_one_attached :image

  belongs_to :profile

  has_many :playlist_tracks, dependent: :delete_all

  private

  def delete_data
    delete_images
  end

  def delete_images
    playlist_tracks.find_each do |t|
      t.image.purge_later
    end
  end
end
