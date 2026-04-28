class Membership < ApplicationRecord
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include Eventable

  validates :community_id,
            uniqueness: {
              scope: :profile_id
            }

  belongs_to :profile

  belongs_to :community, counter_cache: 'members_count'

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
