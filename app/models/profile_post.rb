class ProfilePost < ApplicationRecord
  belongs_to :profile
  belongs_to :other_profile, class_name: 'Profile'

  has_many_attached :images

  scope :for_feed, lambda {
    where('profile_id = other_profile_id')
  }
end
