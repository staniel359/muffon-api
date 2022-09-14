module PostDecorator
  module ClassMethods
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
      by_profile.or(by_community)
    end

    def public
      joins(:profile)
        .where(
          profiles: {
            private: false
          }
        )
    end

    def associated
      includes(
        [profile: image_association],
        [community: image_association],
        images_association
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
