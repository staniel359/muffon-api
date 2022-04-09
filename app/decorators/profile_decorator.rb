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
    Post.with_profile_type.where(
      profile_id: following_profile_ids
    ).where(
      'profile_id = other_profile_id'
    )
  end

  def communities_posts
    Post.with_community_type.where(
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
