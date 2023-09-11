module PostDecorator
  extend ActiveSupport::Concern

  class_methods do
    def with_profile_type
      where(
        post_type: 'profile'
      )
    end

    def with_community_type
      where(
        post_type: 'community'
      )
    end

    def by_profile
      where(
        'profile_id = other_profile_id'
      )
    end

    def by_community
      where(
        by_community: true
      )
    end

    def global
      by_profile
        .or(by_community)
    end

    def global_public
      by_profile
        .by_public_profile
        .or(by_community)
    end

    def associated
      includes(
        [profile: image_association],
        [community: image_association],
        :post_comments,
        images_association
      )
    end
  end

  private

  def eventable_data
    {
      id:,
      text:
    }
  end
end
