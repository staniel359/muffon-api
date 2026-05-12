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

  include Imageable
  include Eventable

  validates :title,
            presence: true,
            uniqueness: true

  has_one_attached :image

  has_many :posts, dependent: :destroy

  has_many :post_comments, through: :posts

  has_many :memberships, dependent: :destroy

  has_many :members,
           through: :memberships,
           source: :profile

  belongs_to :creator,
             class_name: 'Profile',
             foreign_key: :profile_id,
             inverse_of: :own_communities

  class << self
    def members_count_desc_ordered
      order(
        members_count: :desc
      )
    end

    def members_count_asc_ordered
      order(
        members_count: :asc
      )
    end

    def with_membership_created_at
      select(
        <<~SQL.squish
          communities.*,
          memberships.created_at AS created_at
        SQL
      )
    end

    def joined_desc_ordered
      order(
        'memberships.created_at DESC'
      )
    end

    def joined_asc_ordered
      order(
        'memberships.created_at ASC'
      )
    end

    def with_relations
      includes(
        creator: image_association,
        **image_association
      )
    end
  end

  def in_members?(
    profile_id:
  )
    members
      .find_by(
        id: profile_id
      )
      .present?
  end

  def add_member!(
    profile_id:
  )
    memberships.create!(
      profile_id:
    )
  end

  def remove_member!(
    profile_id:
  )
    memberships
      .find_by(
        profile_id:
      )
      .destroy!
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
      title:
    }
  end
end
