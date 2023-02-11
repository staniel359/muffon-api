module MembershipDecorator
  private

  def eventable_data
    { community: community_data }
  end

  def community_data
    {
      id: community_id,
      title: community.title
    }
  end
end
