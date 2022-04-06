class Profile < ApplicationRecord
  before_create :set_token

  has_secure_password

  has_one_attached :image

  has_many :profile_artists, dependent: nil
  has_many :profile_albums, dependent: nil
  has_many :profile_tracks, dependent: nil

  has_many :recommendations, dependent: nil

  has_many :listened_artists, dependent: nil
  has_many :listened_albums, dependent: nil
  has_many :listened_tracks, dependent: nil

  has_many :bookmark_artists, dependent: nil
  has_many :bookmark_albums, dependent: nil
  has_many :bookmark_tracks, dependent: nil

  has_many :favorite_artists, dependent: nil
  has_many :favorite_albums, dependent: nil
  has_many :favorite_tracks, dependent: nil

  has_many :playlists, dependent: nil

  has_many :own_posts,
           class_name: 'Post',
           dependent: nil

  has_many :posts,
           foreign_key: 'other_profile_id',
           inverse_of: :other_profile,
           dependent: nil

  has_many :active_relationships,
           class_name: 'Relationship',
           inverse_of: :profile,
           dependent: nil

  has_many :following_profiles,
           through: :active_relationships,
           source: :other_profile

  has_many :passive_relationships,
           foreign_key: 'other_profile_id',
           class_name: 'Relationship',
           inverse_of: :other_profile,
           dependent: nil

  has_many :follower_profiles,
           through: :passive_relationships,
           source: :profile

  has_many :messages, dependent: nil

  has_many :own_communities,
           class_name: 'Community',
           dependent: nil

  has_many :memberships, dependent: nil

  has_many :communities, through: :memberships

  enum gender: {
    male: 0,
    female: 1,
    other: 2
  }

  enum role: {
    profile: 0,
    creator: 1
  }

  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: URI::MailTo::EMAIL_REGEXP
            }

  validates :password,
            presence: true,
            length: { minimum: 6 },
            on: :create

  validates :password,
            allow_blank: true,
            length: { minimum: 6 },
            on: :update

  validates :nickname,
            presence: true,
            uniqueness: true,
            length: { maximum: 30 }

  class << self
    def relationship_created_desc_ordered
      order(
        'relationships.created_at DESC'
      )
    end

    def associated
      includes(
        image_association
      )
    end
  end

  def conversations
    Conversation.where(
      'profile_id = :id OR other_profile_id = :id',
      id:
    )
  end

  def feed_posts
    following_profiles_posts
      .or(communities_posts)
  end

  def following_profiles_posts
    Post.where(
      profile_id: following_profile_ids
    ).where(
      'profile_id = other_profile_id'
    )
  end

  def communities_posts
    Post.where(
      community_id: community_ids,
      by_community: true
    )
  end

  def tags
    profile_artists
      .left_joins(:artist)
      .pluck(:tag_ids)
      .flatten
      .compact
      .tally
      .sort_by(&:second)
      .reverse
  end

  private

  def set_token
    self.token = SecureRandom.uuid
  end
end
