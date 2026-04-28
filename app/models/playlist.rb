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

  include Imageable
  include Eventable

  validates :title,
            presence: true,
            uniqueness: {
              scope: :profile_id
            }

  has_one_attached :image

  has_many :playlist_tracks, dependent: :destroy

  belongs_to :profile

  class << self
    def tracks_count_desc_ordered
      order(
        tracks_count: :desc,
        created_at: :asc
      )
    end

    def tracks_count_asc_ordered
      order(
        tracks_count: :asc,
        created_at: :asc
      )
    end

    def associated
      includes(
        image_association
      )
    end
  end

  private

  def eventable_data
    {
      id:,
      title:
    }
  end
end
