class Relationship < ApplicationRecord
  belongs_to :profile,
             counter_cache: 'following_profiles_count'
  belongs_to :other_profile,
             class_name: 'Profile',
             counter_cache: 'follower_profiles_count'

  validates :other_profile_id,
            uniqueness: {
              scope: :profile_id
            }
end
