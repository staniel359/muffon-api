class PostComment < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    updated
    deleted
  ].freeze
  EVENT_ATTRIBUTES = %w[
    text
    artists
    albums
    tracks
    playlists
    communities
    videos
    video_channels
    video_playlists
    by_community
  ].freeze

  include Imageable
  include Eventable

  has_many_attached :images

  belongs_to :post

  belongs_to :profile

  belongs_to :community, optional: true

  class << self
    def with_relations
      includes(
        profile: image_association,
        community: image_association,
        **images_association
      )
    end
  end

  def creator?(
    profile_id:
  )
    self.profile_id == profile_id.to_i
  end

  private

  def eventable_data
    {
      id:,
      text:
    }
  end
end
