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
end
