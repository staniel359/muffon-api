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

    def associated
      includes(
        [profile: image_association],
        images_association
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
