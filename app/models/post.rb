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
        '"posts"."profile_id" = "posts"."other_profile_id"'
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
        :other_profile,
        {
          profile: image_association,
          community: image_association,
          **images_association
        }
      )
    end

    def joined
      left_joins(
        :post_comments
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
