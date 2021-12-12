class Relationship < ApplicationRecord
  belongs_to :profile
  belongs_to :other_profile, class_name: 'Profile'

  validates :other_profile_id,
            uniqueness: {
              scope: :profile_id
            }
end
