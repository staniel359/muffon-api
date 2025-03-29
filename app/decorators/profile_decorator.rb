module ProfileDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_email(email)
      find_by(
        'lower(email) = ?',
        email.strip.downcase
      )
    end

    def with_relationship_created_at
      select(
        <<~SQL.squish
          profiles.*,
          relationships.created_at AS created_at
        SQL
      )
    end

    def with_membership_created_at
      select(
        <<~SQL.squish
          profiles.*,
          memberships.created_at AS created_at
        SQL
      )
    end

    def followed_desc_ordered
      order(
        'relationships.created_at DESC'
      )
    end

    def followed_asc_ordered
      order(
        'relationships.created_at ASC'
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

    def followers_count_desc_ordered
      order(
        followers_count: :desc,
        created_at: :asc
      )
    end

    def followers_count_asc_ordered
      order(
        followers_count: :asc,
        created_at: :asc
      )
    end

    def associated
      includes(
        image_association
      )
    end

    def online
      where(
        online: true
      )
    end

    def not_deleted
      where.not(
        nickname: nil
      )
    end
  end

  def conversations
    active_conversations
      .or(passive_conversations)
  end

  def feed_posts
    following_profiles_posts
      .or(communities_posts)
      .or(page_posts)
  end

  def page_posts
    Post
      .with_profile_type
      .where(
        profile_id: id,
        other_profile_id: id
      )
  end

  def following_profiles_posts
    Post
      .with_profile_type
      .by_profile
      .by_public_profile
      .where(
        profile_id: following_profile_ids
      )
  end

  def communities_posts
    Post
      .with_community_type
      .by_community
      .where(
        community_id: community_ids
      )
  end

  def library_tags
    library_artists
      .left_joins(
        :artist
      )
      .pluck(
        :tag_ids
      )
      .flatten
      .compact
      .tally
      .sort_by(
        &:second
      )
      .reverse
      .map { |tag| format_library_tag(tag) }
  end

  def playlist_tracks
    PlaylistTrack
      .joins(
        :playlist
      )
      .where(
        playlists: {
          profile_id: id
        }
      )
  end

  def related_events
    active_events
  end

  def artists_library_artists_ids(
    artists
  )
    library_artists
      .where(
        artist_id: artists_ids(
          artists
        )
      ).pluck(:id)
  end

  def in_followers?(
    profile_id
  )
    follower_profiles
      .find_by(
        id: profile_id
      )
      .present?
  end

  def in_following?(
    profile_id
  )
    following_profiles
      .find_by(
        id: profile_id
      )
      .present?
  end

  private

  def set_token
    self.token = SecureRandom.uuid
  end

  def format_library_tag(
    tag
  )
    id, count = tag

    {
      id:,
      count:
    }
  end

  def artists_ids(
    artists
  )
    artists.map do |name|
      artist_id(
        name
      )
    end.compact
  end

  def artist_id(
    name
  )
    Artist.with_name(
      name
    )&.id
  end

  def profile_id
    id
  end

  def eventable_data
    {}
  end
end
