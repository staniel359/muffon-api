module RelationshipDecorator
  private

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
