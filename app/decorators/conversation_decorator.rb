module ConversationDecorator
  module ClassMethods
    def associated
      includes(
        other_profile: image_association
      )
    end

    def with_or_of_profile(profile_id)
      where(
        'profile_id = :id OR other_profile_id = :id',
        id: profile_id
      )
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
