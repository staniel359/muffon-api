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

  include PostDecorator
  include SendableDecorator
  include Eventable

  enum :post_type, {
    profile: 0,
    community: 1
  }

  before_destroy :delete_data

  has_many_attached :images

  belongs_to :profile

  belongs_to :other_profile,
             class_name: 'Profile',
             optional: true

  belongs_to :community, optional: true

  has_many :post_comments, dependent: :delete_all

  private

  def delete_data
    delete_images
  end

  def delete_images
    post_comments.find_each do |c|
      c.images.purge_later
    end
  end
end
