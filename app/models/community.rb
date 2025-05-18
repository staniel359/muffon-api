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

  has_one_attached :image

  has_many :posts,
           dependent: :destroy

  has_many :post_comments,
           through: :posts

  has_many :memberships,
           dependent: :destroy

  has_many :members,
           through: :memberships,
           source: :profile

  belongs_to :creator,
             class_name: 'Profile',
             foreign_key: :profile_id,
             inverse_of: :own_communities
end
