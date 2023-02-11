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

  def find_other_profile(profile_id)
    starter?(profile_id) ? other_profile : profile
  end

  private

  def starter?(profile_id)
    profile_id.to_i == self.profile_id
  end

  def eventable_data
    {
      other_profile:
        other_profile_data
    }
  end

  def other_profile_data
    {
      id: other_profile_id,
      nickname:
        other_profile.nickname
    }
  end
end
