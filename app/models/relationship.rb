class Relationship < ApplicationRecord
  EVENT_CALLBACKS = %w[
    created
    deleted
  ].freeze

  include Eventable

  validates :other_profile_id,
            uniqueness: {
              scope: :profile_id
            }

  belongs_to :profile,
             counter_cache: 'following_count'

  belongs_to :other_profile,
             class_name: 'Profile',
             counter_cache: 'followers_count'

  private

  def eventable_data
    { other_profile: other_profile_data }
  end

  def other_profile_data
    {
      id: other_profile_id,
      nickname: other_profile.nickname
    }
  end
end
