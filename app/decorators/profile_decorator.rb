module ProfileDecorator
  module ClassMethods
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

  def self.included(base)
    base.extend ClassMethods
  end

  def conversations
    Conversation.with_or_of_profile(id)
  end

  def feed_posts
    page_posts
      .or(following_profiles_posts)
      .or(communities_posts)
  end

  def page_posts
    Post.with_profile_type.where(
      profile_id: id,
      other_profile_id: id
    )
  end

  def following_profiles_posts
    Post
      .with_profile_type
      .by_profile
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

  def follower_of_profile?(other_profile_id)
    follower_profiles
      .find_by(
        id: other_profile_id
      ).present?
  end

  def followed_by_profile?(other_profile_id)
    following_profiles
      .find_by(
        id: other_profile_id
      ).present?
  end

  private

  def format_library_tag(tag)
    id, count = tag

    {
      id:,
      count:
    }
  end
end
