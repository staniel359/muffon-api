module ProfileDecorator
  module ClassMethods
    def relationship_created_desc_ordered
      order(
        'relationships.created_at DESC'
      )
    end

    def library_artists_count_desc_ordered
      order(
        library_artists_count: :desc,
        created_at: :asc
      )
    end

    def library_artists_count_asc_ordered
      order(
        library_artists_count: :asc,
        created_at: :asc
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
  end

  def self.included(base)
    base.extend ClassMethods
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
      .left_joins(:artist)
      .pluck(:tag_ids)
      .flatten
      .compact
      .tally
      .sort_by(&:second)
      .reverse
      .map { |t| format_library_tag(t) }
  end

  def playlist_tracks
    PlaylistTrack
      .joins(:playlist)
      .where(
        playlists: {
          profile_id: id
        }
      )
  end

  def in_followers?(profile_id)
    follower_profiles
      .find_by(id: profile_id)
      .present?
  end

  def in_following?(profile_id)
    following_profiles
      .find_by(id: profile_id)
      .present?
  end

  def delete_library
    library_tracks.delete_all

    library_albums.delete_all

    library_artists.delete_all

    recommendations.delete_all
  end

  def profile_id
    id
  end

  def related_events
    active_events
  end

  private

  def set_token
    self.token = SecureRandom.uuid
  end

  def format_library_tag(tag)
    id, count = tag

    {
      id:,
      count:
    }
  end

  def eventable_data
    {}
  end
end
