class Community < ApplicationRecord
  ORDERS = %w[
    created_desc
    created_asc
    joined_desc
    joined_asc
    members_count_desc
    members_count_asc
  ].freeze
  EVENT_CALLBACKS = %w[
    created
    updated
    deleted
  ].freeze
  EVENT_ATTRIBUTES = %w[
    title
    description
  ].freeze

  include CommunityDecorator
  include Eventable

  validates :title,
            presence: true,
            uniqueness: true

  before_destroy :delete_data

  has_one_attached :image

  belongs_to :creator,
             class_name: 'Profile',
             foreign_key: :profile_id,
             inverse_of: :own_communities

  has_many :posts, dependent: :delete_all

  has_many :post_comments, through: :posts

  has_many :memberships, dependent: :delete_all

  has_many :members,
           through: :memberships,
           source: :profile

  private

  def delete_data
    delete_images

    delete_assosiated_collections
  end

  def delete_images
    posts.find_each do |p|
      p.images.purge_later
    end

    post_comments.find_each do |c|
      c.images.purge_later
    end
  end

  def delete_assosiated_collections
    PostComment.merge(
      post_comments
    ).delete_all
  end
end
