class Post < ApplicationRecord
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

  enum :post_type, {
    profile: 0,
    community: 1
  }

  has_many_attached :images

  has_many :post_comments, dependent: :destroy

  belongs_to :profile

  belongs_to :other_profile,
             class_name: 'Profile',
             optional: true

  belongs_to :community, optional: true

  class << self
    def with_profile_type
      where(
        post_type: 'profile'
      )
    end

    def with_community_type
      where(
        post_type: 'community'
      )
    end

    def by_profile
      where(
        'profile_id = other_profile_id'
      )
    end

    def by_community
      where(
        by_community: true
      )
    end

    def global
      by_profile
        .or(by_community)
    end

    def global_public
      by_profile
        .by_public_profile
        .or(by_community)
    end

    def associated
      includes(
        [{ profile: image_association }],
        [{ community: image_association }],
        :post_comments,
        images_association
      )
    end
  end

  private

  def eventable_data
    {
      id:,
      text:
    }
  end
end
