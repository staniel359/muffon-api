module ConversationDecorator
  extend ActiveSupport::Concern

  class_methods do
    def associated
      includes(
        other_profile:
          image_association
      )
    end

    def with_or_of_profile(
      profile_id
    )
      where(
        'profile_id = :id OR other_profile_id = :id',
        id: profile_id
      )
    end
  end

  def find_other_profile(
    profile_id
  )
    if starter?(profile_id)
      other_profile
    else
      profile
    end
  end

  private

  def starter?(
    profile_id
  )
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
